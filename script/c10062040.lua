local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,2,2)
	Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd024)
	c:RegisterEffect(e1)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetDecktopGroup(tp,3)
	if #g==0 then return end
	Duel.ConfirmCards(tp,g)
	local bg=g:Filter(Card.IsAttribute,nil,ATTRIBUTE_WATER)
	if #bg>0 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local pg=bg:Select(tp,0,1,nil)
		if #pg>0 then Duel.SendtoHand(pg,nil,REASON_EFFECT) end
		for tc in aux.Next(pg) do
			g:RemoveCard(tc)
		end
	end
	if #g>0 then Duel.SendtoDeck(g,nil,SEQ_DECKBOTTOM,REASON_EFFECT) end
end