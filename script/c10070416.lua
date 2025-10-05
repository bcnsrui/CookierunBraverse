local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ItemEffect(c)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return c:GetOverlayCount()>2 and c:IsAttribute(ATTRIBUTE_WATER)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.filter,tp,LOCATION_MZONE,0,1,nil) and
	Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_WATER,2,2) end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WATER,2,2)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.filter,tp,LOCATION_MZONE,0,1,1,nil)
	Duel.SendtoHand(g,nil,REASON_EFFECT)
	Duel.ConfirmCards(1-tp,g)
end