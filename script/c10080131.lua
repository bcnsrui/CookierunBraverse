local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_DARK,2,2)
end
function s.lv3filter(c,tp)
	return c:GetLevel()==3 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFieldGroupCount(tp,LOCATION_GRAVE,0)>=15
	and Duel.GetMatchingGroupCount(s.lv3filter,tp,0,LOCATION_MZONE,nil,tp)>=1
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.lv3filter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #ag>0 then
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,ag,-1)
	Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,ag,1) end
end