local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.SSCookieEffect(c,ATTRIBUTE_DARK,4,4)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return c:IsLevel(3)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
	local cost2=Cookie3.manacostcon(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_DARK,1,1)
	if not cost2 then return end
	if not Duel.SelectYesNo(tp,aux.Stringid(id,0)) then return end
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_DARK,1,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.filter,tp,0,LOCATION_MZONE,0,1,nil)
	if #g>0 then cookie7.bttrashop(e,tp,eg,ep,ev,re,r,rp,g) end
end
function s.andoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local bc=c:GetBattleTarget()
	if not bc then return end
	if not c:IsLocation(LOCATION_MZONE) then return end
	if Duel.GetFieldGroupCount(tp,0,LOCATION_GRAVE)>=15 then
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,bc,1) end
end