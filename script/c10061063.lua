local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.SSCookieEffect(c,ATTRIBUTE_WIND,1,2)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetTurnPlayer()~=tp then return end
	if Duel.GetFieldGroupCount(tp,LOCATION_REMOVED,0)==0 then return end
	if not Duel.SelectYesNo(tp,aux.Stringid(id,0)) then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local mana=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_REMOVED,0,1,1,nil)
	Duel.SendtoGrave(mana,REASON_EFFECT)
	local decktop=Duel.GetDecktopGroup(tp,1)
	Duel.Remove(decktop,POS_FACEUP,REASON_EFFECT)
end