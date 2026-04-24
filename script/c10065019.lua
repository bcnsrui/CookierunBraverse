local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_FIRE,1,1)
end
function s.otherfilter(c,exc,tp)
	return c~=exc and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.otherfilter,tp,LOCATION_MZONE,0,1,nil,e:GetHandler(),tp)
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.otherfilter,tp,LOCATION_MZONE,0,1,1,nil,e:GetHandler(),tp)
	if #g>0 then Duel.SendtoGrave(g,REASON_COST) end
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,e:GetHandler(),1)
end