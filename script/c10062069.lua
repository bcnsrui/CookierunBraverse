local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.SSCookieEffect(c,ATTRIBUTE_DARK,3,3)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return c:IsLevel(1)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
	local cost3=Cookie3.handcostcon(e,tp,eg,ep,ev,re,r,rp,1,1)
	if not cost3 then return end
	if not Duel.SelectYesNo(tp,aux.Stringid(id,0)) then return end
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,1,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.filter,tp,0,LOCATION_MZONE,0,1,nil)
	Cookie7.bttrashop(e,tp,eg,ep,ev,re,r,rp,g)
end