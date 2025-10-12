local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_LIGHT,2,2)
end
function s.lv3filter(c)
	return c:IsFaceup() and c:GetLevel()==3 and c:IsRace(RACE_WARRIOR)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)>=1
	and Duel.GetMatchingGroupCount(s.lv3filter,tp,LOCATION_EXTRA,0,nil)>=1
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	local ct=Duel.GetMatchingGroupCount(s.lv3filter,tp,LOCATION_EXTRA,0,nil)
	if #ag>0 and ct>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,ag,ct) end
end