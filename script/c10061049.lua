local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_LIGHT,2,2)
end
function s.lv2cookiefilter(c)
	return c:IsLevelAbove(2) and c:IsAttribute(ATTRIBUTE_LIGHT)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	local damage=Duel.GetMatchingGroupCount(s.lv2cookiefilter,tp,LOCATION_EXTRA,0,nil)
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,damage)
end