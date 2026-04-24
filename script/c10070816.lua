local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,1,1)
end
function s.windarcherfilter(c,tp)
	return c:IsCode(10062058,10064049,10070805) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.windarcherfilter,tp,LOCATION_MZONE,0,1,nil,tp)
		and Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)>=5
		and Duel.IsExistingMatchingCard(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil,tp)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)
	Cookie7.Alldamageeff(e,tp,eg,ep,ev,re,r,rp,g,1)
end