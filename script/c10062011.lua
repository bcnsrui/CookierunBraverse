local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,3)
	Cookie6.IGCoookieEffect(c,0,ATTRIBUTE_LIGHT,2,2)
end
function s.lightbrakefilter(c)
	return c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsRace(RACE_WARRIOR)
end
function s.sum3check(sg,e,tp,mg)
	return sg:GetSum(Card.GetLevel)==3
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.SendtoExtraP(e:GetHandler(),nil,REASON_COST)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(s.lightbrakefilter,tp,LOCATION_EXTRA,0,nil)
	if #g==0 then return end
	local sg=aux.SelectUnselectGroup(g,e,tp,1,#g,s.sum3check,1,tp,aux.Stringid(10060000,6))
	if #sg>0 then Duel.SendtoHand(sg,nil,REASON_EFFECT) end
end