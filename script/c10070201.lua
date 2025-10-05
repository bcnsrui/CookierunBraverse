local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.SSCookieEffect(c,ATTRIBUTE_LIGHT,3,4)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
	local cost2=Cookie3.manacostcon(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,1,1)
	if not cost2 then return end
	local hg=Duel.GetFieldGroup(tp,0,LOCATION_HAND)
	if #hg==0 then return end
	if not Duel.SelectYesNo(tp,aux.Stringid(id,0)) then return end
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,1,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=hg:Select(1-tp,1,1,nil)
	Duel.SendtoGrave(g,REASON_EFFECT)
end