local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.SSCookieEffect(c,ATTRIBUTE_DARK,2,2)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return c:IsAttribute(ATTRIBUTE_DARK) and c:IsLevelBelow(2)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
	local cost2=Cookie3.manacostcon(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_DARK,1,1)
	if not cost2 then return end
	if not Duel.SelectYesNo(tp,aux.Stringid(id,0)) then return end
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_DARK,1,1)
	local c=e:GetHandler()
	local g=Duel.SelectMatchingCard(tp,s.filter,tp,LOCATION_MZONE,0,1,1,c)
	if #g>0 then
	Cookie7.bttrashop(e,tp,eg,ep,ev,re,r,rp,g)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g2=Duel.SelectMatchingCard(tp,s.filter,tp,0,LOCATION_MZONE,0,0,1,nil)
	Cookie7.bttrashop(e,tp,eg,ep,ev,re,r,rp,g2) end
end