local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.SSCookieEffect(c,ATTRIBUTE_DARK,2,1)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return c:IsAttribute(ATTRIBUTE_DARK)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
	local cost3=Cookie3.handcostcon(e,tp,eg,ep,ev,re,r,rp,1,1)
	if not cost3 then return end
	if not Duel.SelectYesNo(tp,aux.Stringid(id,0)) then return end
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,1,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.filter,tp,LOCATION_GRAVE,0,0,1,nil)
	Duel.SendtoHand(g,nil,REASON_EFFECT)
end