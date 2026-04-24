local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_DARK,3,3)
end
function s.hp2filter(c,tp)
	return c:GetOverlayCount()<=2 and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)>=1
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #ag>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,ag,-3) end
	if Duel.GetFieldGroupCount(tp,LOCATION_GRAVE,0)>=15
	and Duel.GetMatchingGroupCount(s.hp2filter,tp,0,LOCATION_MZONE,nil,tp)>=1 then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local dg=Duel.SelectMatchingCard(tp,s.hp2filter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #dg>0 then Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,dg) end end
end