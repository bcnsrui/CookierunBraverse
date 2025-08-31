local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ItemEffect(c)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return
	Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_WATER,1,1) end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WATER,1,1)
	local g=Duel.GetMatchingGroup(Card.IsStatus,tp,0,LOCATION_MZONE,nil,STATUS_DESTROY_CONFIRMED)
	local count=#g
	if count>0 and Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)>0 then
		Duel.Draw(tp,count,REASON_EFFECT)
	end
end