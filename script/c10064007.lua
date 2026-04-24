local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,1,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_FIRE,1,1)
end
function s.otherredfilter(c,exc,tp)
	return c~=exc and c:IsAttribute(ATTRIBUTE_FIRE) and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return e:GetHandler():GetOverlayCount()>0
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),1)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.otherredfilter,tp,LOCATION_MZONE,0,1,1,nil,e:GetHandler(),tp)
	if #g>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,1) end
end