local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ASCookieEffect(c,ATTRIBUTE_FIRE,1,1)
end
function s.andoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not c:IsLocation(LOCATION_MZONE) then return end
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<1 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local hg=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
	Duel.SendtoGrave(hg,REASON_EFFECT)
end