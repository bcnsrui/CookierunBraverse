if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,3,3)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_DARK,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.lv2filter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsLevelBelow(2) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local g1=Duel.GetMatchingGroup(s.lv2filter,tp,LOCATION_MZONE,0,nil,tp)
	local g2=Duel.GetMatchingGroup(s.lv2filter,tp,0,LOCATION_MZONE,nil,tp)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,g1)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,g2)
end