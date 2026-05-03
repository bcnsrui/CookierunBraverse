if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb00)
	c:RegisterEffect(e1)
end
function s.FlipCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	return ally>=6
end
function s.FlipCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	local g=Duel.GetMatchingGroup(Card.IsCode,tp,LOCATION_SZONE,0,nil,10064057)
	if #g>0 then 
	local e1=Effect.CreateEffect(g:GetFirst())
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xa16)
	e1:SetReset(RESET_PHASE+PHASE_END)
	g:GetFirst():RegisterEffect(e1)
	Duel.Overlay(ally,g) end
end