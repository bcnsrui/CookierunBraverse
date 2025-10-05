local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ISCookieEffect(c,ATTRIBUTE_WATER,4,4)
	e1:SetCountLimit(1)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return c:IsLevelBelow(2)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return
	Cookie3.handcostcon(e,tp,eg,ep,ev,re,r,rp,1,1) end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,1,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.filter,tp,LOCATION_MZONE,0,0,1,nil)
	Duel.SendtoHand(g,nil,REASON_EFFECT)
end