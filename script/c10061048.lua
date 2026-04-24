local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_LIGHT,3,3)
end
function s.lv1cookiefilter(c)
	return c:IsLevel(1) and c:IsAttribute(ATTRIBUTE_LIGHT)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	local attack=Duel.GetMatchingGroupCount(s.lv1cookiefilter,tp,LOCATION_EXTRA,0,nil)
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,math.floor(attack/2))
end