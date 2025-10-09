local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_LIGHT,2,2)
end
function s.lv1cookiefilter(c)
	return c:IsLevel(1) and c:IsRace(RACE_WARRIOR)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g1=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	Duel.SendtoExtraP(g1,nil,REASON_EFFECT)
	if Cookie.gameovercon(e) then Duel.SetLP(tp,10) end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g2=Duel.SelectMatchingCard(tp,s.lv1cookiefilter,tp,LOCATION_EXTRA,0,0,1,nil)
	Duel.SendtoGrave(g2,REASON_EFFECT)
	Duel.SpecialSummon(g2,0,tp,tp,false,false,POS_FACEUP_ATTACK)
end