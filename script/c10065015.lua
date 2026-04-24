local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,1,2)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_FIRE,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.otherhpfilter(c,exc,tp)
	return c~=exc and c:IsRace(RACE_WARRIOR) and c:GetOverlayCount()>0 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	return Duel.IsExistingMatchingCard(s.otherhpfilter,tp,LOCATION_MZONE,0,1,nil,c,tp)
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.otherhpfilter,tp,LOCATION_MZONE,0,1,1,nil,c,tp)
	Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,g,1)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1) end
end