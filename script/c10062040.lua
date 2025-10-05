local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ESCookieEffect(c,ATTRIBUTE_WATER,2,2)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetDecktopGroup(tp,3)
	Duel.ConfirmCards(tp,g)
	local blueg=g:Filter(Card.IsAttribute,nil,ATTRIBUTE_WATER)
	if #blueg>0 then
		if Duel.SelectYesNo(tp,aux.Stringid(id,0)) then
			Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
			local tg=blueg:Select(tp,0,1,nil)
			if #tg>0 then
				Duel.SendtoHand(tg,nil,REASON_EFFECT)
				g:Sub(tg)
			end
		end
	end
	if #g>0 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
		local tg=g:Select(tp,1,#g,nil)
		Duel.SendtoDeck(tg,nil,SEQ_DECKBOTTOM,REASON_EFFECT)
	end
end