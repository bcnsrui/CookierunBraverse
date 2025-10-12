local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_LIGHT,1,1)
end
function s.soulgemfilter(c)
	return c:IsCode(10063043,10068021)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local brake=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	return brake>=3
	and Duel.GetMatchingGroupCount(s.soulgemfilter,tp,LOCATION_GRAVE,0,nil)>=1
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=Duel.SelectMatchingCard(tp,s.soulgemfilter,tp,LOCATION_GRAVE,0,0,1,nil)
	if #sg>0 then
	Duel.SendtoHand(sg,nil,REASON_EFFECT)
	Duel.ConfirmCards(1-tp,sg)
	Duel.ShuffleHand(tp) end
end