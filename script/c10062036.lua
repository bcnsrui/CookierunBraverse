local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.SSCookieEffect(c,ATTRIBUTE_WATER,2,3)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return c:IsLevel(1)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.filter,tp,LOCATION_MZONE,0,1,1,nil)
	Duel.SendtoDeck(g,nil,SEQ_DECKBOTTOM,REASON_EFFECT)
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,8)) then
	Duel.Draw(tp,1,REASON_EFFECT)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp) end
end