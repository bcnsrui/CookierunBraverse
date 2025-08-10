local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ItemEffect(c)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return
	Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_WIND,2,2) end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WIND,2,2)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+RESET_CHAIN)
	e1:SetValue(0xa01)
	c:RegisterEffect(e1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,2,nil)
	Cookie7.doubledamageeff(e,tp,eg,ep,ev,re,r,rp,g,1,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local mana=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_REMOVED,0,1,1,nil)
	Duel.SendtoGrave(mana,REASON_EFFECT)
end