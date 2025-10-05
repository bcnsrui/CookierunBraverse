local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ASCookieEffect(c,ATTRIBUTE_FIRE,2,2)
end
function s.andoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not c:IsLocation(LOCATION_MZONE) then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil)
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1)
end