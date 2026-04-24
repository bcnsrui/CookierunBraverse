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
function s.lv3filter(c)
	return c:IsRace(RACE_WARRIOR) and c:IsLevel(3)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetMatchingGroupCount(s.lv3filter,tp,LOCATION_EXTRA,0,nil)<2 then return end
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),2)
end
