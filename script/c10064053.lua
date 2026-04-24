if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,3,3)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_WIND,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xd03)
	c:RegisterEffect(e2)
end
function s.fieldgreenlv2(c,exc,tp)
	return c~=exc and c:IsAttribute(ATTRIBUTE_WIND) and c:IsRace(RACE_WARRIOR) and c:IsLevelBelow(2) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.fieldgreenlv2,tp,LOCATION_MZONE,0,1,nil,e:GetHandler(),tp)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.fieldgreenlv2,tp,LOCATION_MZONE,0,0,1,nil,e:GetHandler(),tp)
	if #g==0 then return end
	local tc=g:GetFirst()
	Duel.Remove(tc,POS_FACEUP,REASON_EFFECT)
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ATTRIBUTE_WIND,1,1)
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WIND,1,1)
end
function s.AndCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)>=7
		and Duel.IsExistingMatchingCard(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil,tp)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #ag>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,ag,1) end
end