local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_DARK,2,2)
end
function s.purplecookiefilter(c,e,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsAttribute(ATTRIBUTE_DARK)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetDecktopGroup(tp,5)
	Duel.ConfirmCards(tp,g)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=g:FilterSelect(tp,s.purplecookiefilter,0,1,nil,e,tp)
	g:RemoveCard(sg)
	if #g>0 then Duel.SendtoGrave(g,REASON_EFFECT) end
	if #sg>0 then
	local tc=sg:GetFirst()
	Duel.SpecialSummon(tc,0,tp,tp,false,false,POS_FACEUP_ATTACK) end
end