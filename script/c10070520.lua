local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_DARK,1,1)
end
function s.lv1purplefilter(c,tp)
	return c:GetLevel()==1 and c:IsAttribute(ATTRIBUTE_DARK) and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Trapcost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.GetMatchingGroupCount(s.lv1purplefilter,tp,LOCATION_MZONE,0,nil,tp)>=1
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)>=1
end
function s.Trapcostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.lv1purplefilter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,g)
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #ag>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,ag,-3) end
end