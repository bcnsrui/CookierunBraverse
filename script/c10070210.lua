if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,4)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_LIGHT,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.lv1filter(c)
	return c:IsRace(RACE_WARRIOR) and c:IsLevel(1) and c:IsFaceup()
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)>=6
		and Duel.GetMatchingGroupCount(s.lv1filter,tp,LOCATION_EXTRA,0,nil)>=1
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)>=6 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local g=Duel.SelectMatchingCard(tp,s.lv1filter,tp,LOCATION_EXTRA,0,0,1,nil)
		Duel.SendtoGrave(g,REASON_EFFECT)
	end
end