local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_DARK,1,1)
end
function s.purplefilter(c)
	return c:IsAttribute(ATTRIBUTE_DARK) and c:IsRace(RACE_WARRIOR)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local deckcount=Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)
	local g=Duel.GetDecktopGroup(tp,math.min(3,deckcount))
	Duel.ConfirmCards(tp,g)
	local sg=g:Filter(s.purplefilter,nil)
	if #sg>0 and Duel.SelectYesNo(tp,aux.Stringid(10061004,4)) then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local tc=sg:Select(tp,1,1,nil)
		Duel.SendtoHand(tc,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,tc)
		g:RemoveCard(tc) end
	if #g>0 then Duel.SendtoGrave(g,REASON_EFFECT) end
end