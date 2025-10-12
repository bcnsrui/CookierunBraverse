local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_DARK,2,2)
end
function s.hp2filter(c,tp)
	return c:GetOverlayCount()<=2 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.hp2filter,tp,0,LOCATION_MZONE,nil,tp)>=1
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.hp2filter,tp,0,LOCATION_MZONE,1,1,nil,tp)
	if #ag>0 then Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,ag) end
end