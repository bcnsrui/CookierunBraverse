local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_FIRE,2,2)
end
function s.hp2filter(c,tp)
	return c:GetOverlayCount()>=2 and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.hp2filter,tp,LOCATION_MZONE,LOCATION_MZONE,nil,tp)>=1
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(s.hp2filter,tp,LOCATION_MZONE,LOCATION_MZONE,nil,tp)
	Cookie7.Alldamageeff(e,tp,eg,ep,ev,re,r,rp,g,1)
end