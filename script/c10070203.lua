local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ASCookieEffect(c,ATTRIBUTE_LIGHT,2,3)
end
function s.filter(c)
	return c:IsLevel(1)
end
function s.andoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not c:IsLocation(LOCATION_MZONE) then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.filter,tp,LOCATION_EXTRA,0,0,1,nil)
	Duel.SendtoGrave(ag,REASON_EFFECT)
end