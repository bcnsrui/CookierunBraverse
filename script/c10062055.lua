local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.SSCookieEffect(c,ATTRIBUTE_DARK,3,3)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return c:IsLevelBelow(2)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
	local cost2=Cookie3.manacostcon(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_DARK,1,1)
	if not cost2 then return end
	if not Duel.SelectYesNo(tp,aux.Stringid(id,0)) then return end
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_DARK,1,1)
	local g=Duel.GetMatchingGroup(s.filter,tp,LOCATION_MZONE,LOCATION_MZONE,nil)
	if #g>0 then Cookie7.bttrashop(e,tp,eg,ep,ev,re,r,rp,g) end
end