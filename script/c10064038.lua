if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,3,3)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_LIGHT,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xd031)
	c:RegisterEffect(e2)
end
function s.ylv2below(c)
	return c:IsFaceup() and c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsRace(RACE_WARRIOR) and c:IsLevelBelow(2)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.ylv2below,tp,LOCATION_EXTRA,0,1,nil)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.ylv2below,tp,LOCATION_EXTRA,0,0,1,nil)
	if #g>0 then Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,g) end
end
function s.otheryellow(c,e)
	local tp=e:GetHandlerPlayer()
	return c~=e:GetHandler() and c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.IsExistingMatchingCard(s.otheryellow,tp,LOCATION_MZONE,0,1,nil,e) then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1) end end
end