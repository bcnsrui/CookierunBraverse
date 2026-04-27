if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,1,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xc05)
	c:RegisterEffect(e1)
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_SINGLE)
	e0:SetCode(EFFECT_ADD_SETCODE)
	e0:SetValue(0xd031)
	c:RegisterEffect(e0)
end
function s.handcookiefilter(c)
	return c:IsRace(RACE_WARRIOR)
end
function s.lv1arenafilter(c,exc)
	return c:IsFaceup() and c:IsLevel(1) and c:IsSetCard(0xc01) and c~=exc
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.handcookiefilter,tp,LOCATION_HAND,0,1,nil)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.handcookiefilter,tp,LOCATION_HAND,0,1,1,nil)
	if #g>0 then Duel.SendtoExtraP(g,nil,REASON_COST)
	local exc=Duel.GetOperatedGroup():GetFirst()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local dg=Duel.SelectMatchingCard(tp,s.lv1arenafilter,tp,LOCATION_EXTRA,0,0,1,nil,exc)
	if #dg>0 then Duel.SendtoHand(dg,nil,REASON_EFFECT) end end
end