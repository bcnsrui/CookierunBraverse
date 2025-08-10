local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ItemEffect(c)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.filter(c,e,tp)
	return c:IsRace(RACE_WARRIOR)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return
	Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_WIND,2,2) and
	Duel.IsExistingMatchingCard(s.filter,tp,LOCATION_GRAVE,0,1,nil,e,tp) end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WIND,2,2)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.filter,tp,LOCATION_GRAVE,0,0,1,nil,e,tp)
	Duel.SpecialSummon(ag,0,tp,tp,true,true,POS_FACEUP_ATTACK)
	Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,ag)
end