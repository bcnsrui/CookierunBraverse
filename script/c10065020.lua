local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_FIRE,2,2)
end
function s.hpfilter(c,tp)
	return c:IsFaceup() and c:IsRace(RACE_WARRIOR) and c:GetOverlayCount()==1 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.hpfilter,tp,LOCATION_MZONE,0,nil,tp)>=2
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)
	Cookie7.doubledamageeff(e,tp,eg,ep,ev,re,r,rp,g,2,2)
end