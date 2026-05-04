if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,2)
	Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd014)
	c:RegisterEffect(e1)
end
function s.yellowbreakfilter(c)
	return c:IsRace(RACE_WARRIOR) and c:IsAttribute(ATTRIBUTE_LIGHT)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetMatchingGroupCount(s.yellowbreakfilter,tp,LOCATION_EXTRA,0,nil)>=3 then
	local ct=Duel.AnnounceNumber(tp,2,1,0)
	if ct>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,ct) end end
end