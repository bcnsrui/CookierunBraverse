local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_DARK,2,2)
end
function s.moonfilter(c,tp)
	return c:IsCode(10064089,10071002)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.moonfilter,tp,LOCATION_MZONE+LOCATION_GRAVE,0,1,nil,tp)
		and Duel.IsExistingMatchingCard(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil,tp)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)
	if #g>0 then Cookie7.Allhptrasheff(e,tp,eg,ep,ev,re,r,rp,g,1) end
end