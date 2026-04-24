if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,3,3)
	Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd014)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xd03)
	c:RegisterEffect(e2)
end
function s.summonfilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsAttribute(ATTRIBUTE_DARK) and c:IsLevelBelow(2)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetLocationCount(tp,LOCATION_MZONE)>0 then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.summonfilter,tp,LOCATION_GRAVE,0,0,1,nil,tp)
	if #g>0 then Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,g) end end
end
function s.costfilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsAttribute(ATTRIBUTE_DARK) and c:IsLevelBelow(2) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.costfilter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.costfilter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,g)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local count=Duel.AnnounceNumber(tp,2,1,0)
	if count>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count) end
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)>0 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
		local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
		Duel.SendtoGrave(g,REASON_EFFECT)
	end
end