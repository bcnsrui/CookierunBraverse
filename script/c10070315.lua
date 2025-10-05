local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ISCookieEffect(c,ATTRIBUTE_WIND,3,3)
	e1:SetCountLimit(1)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.GetFieldGroupCount(tp,LOCATION_REMOVED,0)>0 end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local mana=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_REMOVED,0,1,1,nil)
	Duel.SendtoGrave(mana,REASON_EFFECT)
	local c=e:GetHandler()
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,c,1)
end