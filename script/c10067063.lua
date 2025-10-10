local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,1,1)
end
function s.arenafilter(c)
	return c:IsSetCard(0xc01)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local deckcount=Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)
	local g=Duel.GetDecktopGroup(tp,math.min(3,deckcount))
	Duel.ConfirmCards(tp,g)
	local sg=g:Filter(s.arenafilter,nil)
	if #sg>0 and Duel.SelectYesNo(tp,aux.Stringid(id,0)) then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local tc=sg:Select(tp,1,1,nil)
		local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
		Duel.Overlay(ally,tc)
		g:RemoveCard(tc) end
	if #g>0 then Duel.SendtoGrave(g,REASON_EFFECT) end
end