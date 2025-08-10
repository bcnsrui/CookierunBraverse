local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.StageEffect(c,ATTRIBUTE_WIND,1,1)
	e1:SetCountLimit(1)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetFieldGroupCount(tp,LOCATION_REMOVED,0)>0 end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local mana=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_REMOVED,0,1,1,nil)
	Duel.SendtoHand(mana,nil,REASON_EFFECT)
	Duel.ConfirmCards(1-tp,mana)
	Duel.Draw(tp,1,REASON_EFFECT)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
end