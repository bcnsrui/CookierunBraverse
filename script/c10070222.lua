local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.StageEffect(c,ATTRIBUTE_LIGHT,1,1)
	e1:SetCountLimit(1)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return c:IsLevel(1) and c:IsAttribute(ATTRIBUTE_LIGHT)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.filter,tp,LOCATION_EXTRA,0,1,nil)
	and Duel.IsExistingMatchingCard(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,1,nil) end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.filter,tp,LOCATION_EXTRA,0,1,1,nil)
	Duel.SendtoHand(g,nil,REASON_EFFECT)
	Duel.ConfirmCards(1-tp,g)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g2=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,1,1,nil)
	Duel.SendtoExtraP(g2,tp,REASON_EFFECT)
end