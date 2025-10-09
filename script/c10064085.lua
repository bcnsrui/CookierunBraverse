local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WATER,2,2)
end
function s.Itemcost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,chk,ALL_COLOR,4,4)
end
function s.Itemcostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,4,4)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,2,nil,tp)
	Cookie7.doubledamageeff(e,tp,eg,ep,ev,re,r,rp,g,1,1)
	local count=Duel.AnnounceNumber(tp,4,3,2,1,0)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count)
end