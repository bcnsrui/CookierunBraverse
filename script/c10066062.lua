local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,1,1)
end
function s.supportcookiefilter(c)
	return c:IsRace(RACE_WARRIOR)
end
function s.Itemcost(e,tp,eg,ep,ev,re,r,rp,chk)
	local supportarea=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	return supportarea:IsExists(s.supportcookiefilter,1,nil)
end
function s.Itemcostoperation(e,tp,eg,ep,ev,re,r,rp)
	local supportarea=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local sg=supportarea:Filter(s.supportcookiefilter,nil)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local tc=sg:Select(tp,1,1,nil)
	Duel.SendtoHand(tc,nil,REASON_COST)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1) end
end