local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_DARK,3,3)
end
function s.lv2cookiefilter(c,tp)
	return c:IsLevelBelow(2) and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.lv2cookiefilter,tp,0,LOCATION_MZONE,nil,tp)>=1
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.lv2cookiefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,ag)
end