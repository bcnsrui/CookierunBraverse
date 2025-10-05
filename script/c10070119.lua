local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ItemEffect(c)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return
	Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_FIRE,1,1) end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_FIRE,1,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,nil)
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,1)
end