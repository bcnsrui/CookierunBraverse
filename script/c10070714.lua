local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_LIGHT,1,1)
end
function s.treefilter(c)
	return c:IsCode(10064038,10070710)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.treefilter,tp,LOCATION_MZONE+LOCATION_EXTRA,0,1,nil)
		and Duel.IsExistingMatchingCard(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #g>0 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,g,1) end
end