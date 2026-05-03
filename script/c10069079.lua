if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,2,3)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
end
function s.shadow_milk_filter(c,e,tp,eg,ep,ev,re,r,rp)
	if not (c:IsFacedown() and c:IsCode(table.unpack(CARD_SHADOW_MILK))) then return false end
	local code=c:GetCode()
	local gtbl=_G["c" .. code]
	if not gtbl or type(gtbl.AndCookiecost) ~= "function" then return true end
	return gtbl.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.shadow_milk_filter,tp,LOCATION_EXTRA,0,1,nil,e,tp,eg,ep,ev,re,r,rp)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.shadow_milk_filter,tp,LOCATION_EXTRA,0,0,1,nil,e,tp,eg,ep,ev,re,r,rp)
	if #g==0 then return end
	Duel.ConfirmCards(1-tp,g)
	local code=g:GetFirst():GetCode()
	local gtbl=_G["c" .. code]
	local cost1=true
	if gtbl and type(gtbl.AndCookiecost) == "function" then
	cost1=gtbl.AndCookiecost(e,tp,eg,ep,ev,re,r,rp) end
	if #g>0 and cost1 then
	local costop1=function(e,tp,eg,ep,ev,re,r,rp) return end
	local operation1=function(e,tp,eg,ep,ev,re,r,rp) return end
	if gtbl and type(gtbl.AndCookiecostoperation) == "function" then
		costop1=gtbl.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp) end
	if gtbl and type(gtbl.AndCookieoperation) == "function" then
		operation1=gtbl.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp) end end
end