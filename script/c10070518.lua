local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ItemEffect(c)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return c:GetOverlayCount()<5 and c:IsRace(RACE_WARRIOR)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return
	Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_DARK,3,3) end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_DARK,3,3)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.filter,tp,0,LOCATION_ONFIELD,1,1,nil)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,g)
end