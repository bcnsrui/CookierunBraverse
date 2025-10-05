local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.SSCookieEffect(c,ATTRIBUTE_LIGHT,2,4)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return c:IsLevel(1)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
	local cost2=Cookie3.manacostcon(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,1,1)
	if not cost2 then return end
	if not Duel.SelectYesNo(tp,aux.Stringid(id,0)) then return end
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,1,1)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	if ally<6 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.filter,tp,LOCATION_EXTRA,0,0,1,nil)
	Duel.SendtoGrave(ag,REASON_EFFECT)
end