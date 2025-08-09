local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.SSCookieEffect(c,ATTRIBUTE_LIGHT,3,3)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.filter(c,e,tp)
	return c:IsLevel(1) and c:IsCanBeSpecialSummoned(e,0,tp,false,false)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
	local cost2=Cookie3.manacostcon(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,2,2)
	if not cost2 then return end
	if not Duel.SelectYesNo(tp,aux.Stringid(id,0)) then return end
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,2,2)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.filter,tp,LOCATION_EXTRA,0,0,1,nil,e,tp)
	Duel.Remove(ag,POS_FACEUP,REASON_EFFECT)
	Duel.SpecialSummon(ag,0,tp,tp,true,true,POS_FACEUP_ATTACK)
	Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,ag)
end