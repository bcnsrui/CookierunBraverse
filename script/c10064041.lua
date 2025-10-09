local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_LIGHT,2,2)
end
function s.lv3cookiefilter(c)
	return c:IsFaceup() and c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsLevel(3) and c:IsRace(RACE_WARRIOR)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #g>0 then
	local tc=g:GetFirst()
	local ct=Duel.GetMatchingGroupCount(s.lv3cookiefilter,tp,LOCATION_EXTRA,0,nil)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,tc,ct) end
end