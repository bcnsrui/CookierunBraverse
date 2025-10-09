local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,2,2)
end
function s.cookiefilter(c)
	return c:IsRace(RACE_WARRIOR)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.cookiefilter,tp,LOCATION_GRAVE,0,nil)>=1
	and Duel.GetLocationCount(tp,LOCATION_MZONE)>0
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetLocationCount(tp,LOCATION_MZONE)==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.cookiefilter,tp,LOCATION_GRAVE,0,0,1,nil,e,tp)
	Duel.SpecialSummon(ag,0,tp,tp,true,true,POS_FACEUP_ATTACK)
end