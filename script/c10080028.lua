local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_LIGHT,2,2,1,1)
end
function s.handfilter(c)
	return c:IsAttribute(ATTRIBUTE_LIGHT) and c:GetLevel()>=2 and c:IsRace(RACE_WARRIOR)
end
function s.breakfilter(c)
	return c:IsFaceup() and c:GetLevel()==1 and c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsLocation(LOCATION_EXTRA)
end
function s.Stageeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.breakfilter,tp,LOCATION_EXTRA,0,1,nil)
end
function s.Stagecost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.handfilter,tp,LOCATION_HAND,0,1,nil) end
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local hg=Duel.SelectMatchingCard(tp,s.handfilter,tp,LOCATION_HAND,0,1,1,nil)
	Duel.SendtoExtraP(hg,nil,REASON_EFFECT)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local yellowlv1=Duel.SelectMatchingCard(tp,s.breakfilter,tp,LOCATION_EXTRA,0,1,1,nil)
	Duel.SendtoHand(yellowlv1,nil,REASON_EFFECT)
end