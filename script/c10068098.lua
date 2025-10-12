local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_WATER,2,2)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)>=1
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #ag>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,ag,-2) end
	if Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ATTRIBUTE_WATER,1,1)
	and Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=2
	and Duel.SelectYesNo(tp,aux.Stringid(10061004,5)) then
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WATER,1,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,7))
	local count=Duel.AnnounceNumber(tp,3,2,1,0)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count) end
end