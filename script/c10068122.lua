local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_DARK,1,1)
end
function s.purplenotcookiefilter(c)
	return c:IsAttribute(ATTRIBUTE_DARK) and not c:IsRace(RACE_WARRIOR)
end
function s.Itemcost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.purplenotcookiefilter,tp,LOCATION_HAND,0,1,e:GetHandler())
end
function s.Itemcostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.purplenotcookiefilter,tp,LOCATION_HAND,0,1,1,e:GetHandler())
	Duel.SendtoGrave(g,REASON_COST)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,7))
	local draw=Duel.AnnounceNumber(tp,2,1,0)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,draw)
end