local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.SSCookieEffect(c,ATTRIBUTE_LIGHT,3,3)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return c:IsLevelBelow(2)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
	local cost2=Cookie3.manacostcon(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,2,2)
	local cost3=Cookie3.handcostcon(e,tp,eg,ep,ev,re,r,rp,1,1)
	if not (cost2 and cost3) then return end
	if not Duel.SelectYesNo(tp,aux.Stringid(id,0)) then return end
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,1,1)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,2,2)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.filter,tp,LOCATION_EXTRA,0,0,1,nil)
	Duel.SendtoGrave(ag,REASON_EFFECT)
end
function s.filter2(c)
	return c:IsLevel(1)
end
function s.andoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not c:IsLocation(LOCATION_MZONE) then return end
	if not Duel.SelectYesNo(tp,aux.Stringid(id,0)) then return end
	local cost2=Cookie3.manacostcon(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,1,1)
	if cost2 then
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,1,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.filter2,tp,0,LOCATION_MZONE,0,1,nil)
	Duel.SendtoExtraP(g,tp,REASON_EFFECT) end
end