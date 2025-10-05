local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ISCookieEffect(c,ATTRIBUTE_WATER,3,3)
	e1:SetCountLimit(1)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return
	Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,chk,3,3) end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,3,3)
	Duel.ChangePosition(e:GetHandler(),POS_FACEUP_ATTACK)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local mana2=Duel.SelectMatchingCard(tp,Card.IsFacedown,tp,LOCATION_REMOVED,0,1,1,nil)
	Duel.SendtoGrave(mana2,REASON_EFFECT)
	Duel.Remove(mana2,POS_FACEUP,REASON_EFFECT)
end