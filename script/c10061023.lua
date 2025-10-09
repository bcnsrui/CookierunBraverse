local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_FIRE,1,1)
end
function s.hp1cookiefilter(c,tp)
	return c:GetOverlayCount()>1 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Itemcost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.GetMatchingGroupCount(s.hp1cookiefilter,tp,LOCATION_MZONE,0,nil,tp)>=1
end
function s.Itemcostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.hp1cookiefilter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,g,g:GetFirst():GetOverlayCount()-1)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,ag,2)
end