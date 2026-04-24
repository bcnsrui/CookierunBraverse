local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WIND,2,2)
end
function s.greenfilter(c)
	return c:IsAttribute(ATTRIBUTE_WIND) and c:IsRace(RACE_WARRIOR)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local support=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0):Filter(s.greenfilter,nil)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=support:Select(tp,0,1,nil)
	if #g>0 then Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,g) end
end