local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_DARK,2,2)
end
function s.arenafilter(c)
	return c:IsSetCard(0xc01) and c:IsRace(RACE_WARRIOR)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
	and Duel.GetMatchingGroupCount(s.arenafilter,tp,LOCATION_GRAVE,0,nil)>=1
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.arenafilter,tp,LOCATION_GRAVE,0,0,1,nil)
	if #g>0 then
	local tc=g:GetFirst()
	Duel.SpecialSummon(tc,0,tp,tp,false,false,POS_FACEUP_ATTACK)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,tc,1)	end
end