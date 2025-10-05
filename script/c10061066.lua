local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ETCookieEffect(c,ATTRIBUTE_WIND,3,3)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	if not Duel.IsExistingMatchingCard(Card.IsFacedown,tp,LOCATION_REMOVED,0,1,nil) then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local mana2=Duel.SelectMatchingCard(tp,Card.IsFacedown,tp,LOCATION_REMOVED,0,1,1,nil)
	Duel.SendtoGrave(mana2,REASON_EFFECT)
	Duel.Remove(mana2,POS_FACEUP,REASON_EFFECT)
end