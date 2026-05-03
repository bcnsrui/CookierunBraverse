if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,0,0)
	Cookie6.QECoookieEffect2(c)
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_QUICK_O)
	e0:SetCode(EVENT_FREE_CHAIN)
	e0:SetRange(LOCATION_EXTRA)
	e0:SetCondition(s.Summoncon)
	e0:SetTarget(Cookie3.notg)
	e0:SetOperation(s.Summonop)
	c:RegisterEffect(e0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd014)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xd03)
	c:RegisterEffect(e2)	
end
function s.flipyellow(c)
	return c:IsRace(RACE_WARRIOR) and c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsSetCard(0xb00)
end
function s.Summoncon(e)
	local tp=e:GetHandlerPlayer()
	return Cookie8.ExtraSummoncon(e) and Duel.GetMatchingGroupCount(s.flipyellow,tp,LOCATION_HAND,0,nil)>=3
end
function s.Summonop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.flipyellow,tp,LOCATION_HAND,0,3,3,nil)
	if #g~=3 then return end
	Duel.SendtoGrave(g,REASON_COST)
	Cookie8.ExtraSummonop(e,tp,eg,ep,ev,re,r,rp)
end
function s.lv1break(c)
	return c:IsFaceup() and c:IsLevel(1) and c:IsRace(RACE_WARRIOR)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.lv1break,tp,LOCATION_EXTRA,0,0,1,nil)
	if #g>0 then Duel.SendtoGrave(g,REASON_EFFECT) end
end
function s.flipcookiefilter(c)
	return c:IsRace(RACE_WARRIOR) and c:IsSetCard(0xb00)
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.flipcookiefilter,tp,LOCATION_HAND,0,1,nil)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.flipcookiefilter,tp,LOCATION_HAND,0,1,1,nil)
	local code=g:GetFirst():GetCode()
	local gtbl=_G["c" .. code]
	local cost1=true
	if gtbl and type(gtbl.FlipCookiecost) == "function" then
	cost1=gtbl.FlipCookiecost(e,tp,eg,ep,ev,re,r,rp) end
	if #g>0 and cost1 then
	Duel.MoveToField(g:GetFirst(),tp,tp,LOCATION_SZONE,POS_FACEUP,true)
	local costop1=function(e,tp,eg,ep,ev,re,r,rp) return end
	local operation1=function(e,tp,eg,ep,ev,re,r,rp) return end
	if gtbl and type(gtbl.FlipCookiecostoperation) == "function" then
		costop1=gtbl.FlipCookiecostoperation(e,tp,eg,ep,ev,re,r,rp) end
	if gtbl and type(gtbl.FlipCookieoperation) == "function" then
		operation1=gtbl.FlipCookieoperation(e,tp,eg,ep,ev,re,r,rp) end
	if not g:GetFirst():IsSetCard(0xa16) then
		Duel.Remove(g:GetFirst(),POS_FACEUP,REASON_RULE)
		Duel.SendtoGrave(g:GetFirst(),REASON_RULE|REASON_RETURN) end end
end