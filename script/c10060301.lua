local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ISCookieEffect(c,ATTRIBUTE_WIND,1,1)
	e1:SetCountLimit(1)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	local cost2=Cookie3.manacostcon(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WIND,1,1)
	if not cost2 then return end
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WIND,1,1)
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)>6 then return end
	local mana=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_REMOVED,0,1,1,nil)
	Duel.SendtoHand(mana,nil,REASON_EFFECT)
	Duel.ConfirmCards(1-tp,mana)
	local decktop=Duel.GetDecktopGroup(tp,1)
	Duel.ConfirmCards(1-tp,decktop)
	Duel.Remove(decktop,POS_FACEDOWN,REASON_EFFECT)
end