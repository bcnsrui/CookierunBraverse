local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_FIRE,2,2)
end
function s.hp1cookiefilter(c,tp)
	return c:IsLevelAbove(2) and c:IsRace(RACE_WARRIOR) and c:GetOverlayCount()==1 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.hp1cookiefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,ag,2)
end