local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ItemEffect(c)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return
	Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_WIND,1,1) end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WIND,1,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local mana=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_REMOVED,0,1,1,nil)
	Duel.SendtoHand(mana,nil,REASON_EFFECT)
	Duel.ConfirmCards(1-tp,mana)
	if not Duel.SelectYesNo(tp,aux.Stringid(10060001,8)) then return end
	Duel.Draw(tp,1,REASON_EFFECT)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
end