local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,1,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_LIGHT,1,1)
end
function s.cookiefilter(c)
	return c:IsRace(RACE_WARRIOR)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.GetMatchingGroupCount(s.cookiefilter,tp,LOCATION_HAND,0,nil)>=1
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.cookiefilter,tp,LOCATION_HAND,0,1,1,nil)
	if #g>0 then Duel.SendtoExtraP(g,nil,REASON_COST) end
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local count=Duel.AnnounceNumber(tp,2,1,0)
	if count==0 then return end
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count)
end