if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,3,3)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
end
function s.ig_playable(gtbl,e,tp,eg,ep,ev,re,r,rp)
	if type(gtbl.IGCookieoperation)~="function" then return false end
	if type(gtbl.IGCookiecost)=="function" and not gtbl.IGCookiecost(e,tp,eg,ep,ev,re,r,rp) then return false end
	return true
end
function s.qe_playable(gtbl,e,tp,eg,ep,ev,re,r,rp)
	if type(gtbl.QECookieoperation)~="function" then return false end
	if type(gtbl.QECookiecost)=="function" and not gtbl.QECookiecost(e,tp,eg,ep,ev,re,r,rp) then return false end
	return true
end
function s.effcondition(gtbl,kind,e,tp,eg,ep,ev,re,r,rp)
	if kind=="ig" and type(gtbl.IGCookieeffcondition)=="function" then
		return gtbl.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp) end
	if kind=="qe" and type(gtbl.QECookieeffcondition)=="function" then
		return gtbl.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp) end
	return true
end
function s.shadow_milk_filter(c,e,tp,eg,ep,ev,re,r,rp)
	if not (c:IsFacedown() and c:IsCode(table.unpack(CARD_SHADOW_MILK))) then return false end
	local gtbl=_G["c" .. c:GetCode()]
	if not gtbl then return false end
	return s.ig_playable(gtbl,e,tp,eg,ep,ev,re,r,rp) or s.qe_playable(gtbl,e,tp,eg,ep,ev,re,r,rp)
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ALL_COLOR,0,1)
	and Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,chk,ALL_COLOR,1,1)
	and Duel.IsExistingMatchingCard(s.shadow_milk_filter,tp,LOCATION_EXTRA,0,1,nil,e,tp,eg,ep,ev,re,r,rp)
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,0,1)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,1,1)
end
function s.run_ig(e,tp,eg,ep,ev,re,r,rp,gtbl)
	local cost1=true
	if gtbl and type(gtbl.IGCookiecost)=="function" then
	cost1=gtbl.IGCookiecost(e,tp,eg,ep,ev,re,r,rp) end
	if not cost1 then return end
	local costop1=function(e,tp,eg,ep,ev,re,r,rp) return end
	local operation1=function(e,tp,eg,ep,ev,re,r,rp) return end
	if gtbl and type(gtbl.IGCookiecostoperation)=="function" then
		costop1=gtbl.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp) end
	if gtbl and type(gtbl.IGCookieoperation)=="function" then
		operation1=gtbl.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp) end
end
function s.run_qe(e,tp,eg,ep,ev,re,r,rp,gtbl)
	local cost1=true
	if gtbl and type(gtbl.QECookiecost)=="function" then
	cost1=gtbl.QECookiecost(e,tp,eg,ep,ev,re,r,rp) end
	if not cost1 then return end
	local costop1=function(e,tp,eg,ep,ev,re,r,rp) return end
	local operation1=function(e,tp,eg,ep,ev,re,r,rp) return end
	if gtbl and type(gtbl.QECookiecostoperation)=="function" then
		costop1=gtbl.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp) end
	if gtbl and type(gtbl.QECookieoperation)=="function" then
		operation1=gtbl.QECookieoperation(e,tp,eg,ep,ev,re,r,rp) end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	while true do
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
		local g=Duel.SelectMatchingCard(tp,s.shadow_milk_filter,tp,LOCATION_EXTRA,0,0,1,nil,e,tp,eg,ep,ev,re,r,rp)
		if #g==0 then return end
		Duel.ConfirmCards(1-tp,g)
		local tc=g:GetFirst()
		local gtbl=_G["c" .. tc:GetCode()]
		if not gtbl then return end
		local ig_ok=s.ig_playable(gtbl,e,tp,eg,ep,ev,re,r,rp)
		local qe_ok=s.qe_playable(gtbl,e,tp,eg,ep,ev,re,r,rp)
		local kind
		if ig_ok and qe_ok then
			if Duel.SelectOption(tp,aux.Stringid(id,0),aux.Stringid(id,1))==0 then
				kind="ig"
			else kind="qe" end
		elseif ig_ok then kind="ig"
		elseif qe_ok then kind="qe"
		else return end
		if not s.effcondition(gtbl,kind,e,tp,eg,ep,ev,re,r,rp)
		and not Duel.SelectYesNo(tp,aux.Stringid(10060001,10)) then
		else
			Duel.SendtoGrave(tc,REASON_EFFECT)
			if kind=="ig" then s.run_ig(e,tp,eg,ep,ev,re,r,rp,gtbl)
			else s.run_qe(e,tp,eg,ep,ev,re,r,rp,gtbl) end
			return
		end
	end
end
