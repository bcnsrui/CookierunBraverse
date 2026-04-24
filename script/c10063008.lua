local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,1,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_FIRE,3,3)
end
function s.lv1filter(c,tp)
	return c:IsLevel(1) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.lv1filter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	Cookie3.Cookiedestroyop(e,tp,eg,ep,ev,re,r,rp,g)
end