local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ESCookieEffect(c,ATTRIBUTE_DARK,2,2)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return c:IsLevel(1)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.filter,tp,0,LOCATION_MZONE,0,1,nil)
	Cookie7.bttrashop(e,tp,eg,ep,ev,re,r,rp,g)
end