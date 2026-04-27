if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
	Cookie6.QECoookieEffect(c,ALL_COLOR,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd021)
	c:RegisterEffect(e1)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.restcostcon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_WIND,1,0)
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.restcost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WIND,1,0)
end
function s.arenafilter(c)
	return c:IsSetCard(0xc01)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	local g=Duel.SelectMatchingCard(tp,s.arenafilter,tp,LOCATION_HAND,0,0,1,nil)
	if ally and #g>0 then Duel.Overlay(ally,g) end
end