local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ISCookieEffect(c,ATTRIBUTE_DARK,2,2)
	e1:SetCountLimit(1)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return c:IsLevel(1) or c:IsLocation(LOCATION_FZONE)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return
	Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_DARK,1,1) and
	Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,chk,1,1) end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_DARK,1,1)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,1,1)	
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.filter,tp,0,LOCATION_ONFIELD,1,1,nil)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,g)
end