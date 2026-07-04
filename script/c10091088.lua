if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,3,3)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_DARK,0,0)
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
function s.purplelv1filter(c,tp)
	return c:IsAttribute(ATTRIBUTE_DARK) and c:GetLevel()==1 and c:IsRace(RACE_WARRIOR)
		and Cookie3.NoEmFzonefilter(c,tp)
end
function s.purplelv2gravefilter(c)
	return c:IsAttribute(ATTRIBUTE_DARK) and c:IsLevelAbove(2) and c:IsRace(RACE_WARRIOR)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.purplelv1filter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.purplelv1filter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	if #g>0 then Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,g) end
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.purplelv2gravefilter,tp,LOCATION_GRAVE,0,0,1,nil)
	if #g>0 then Duel.SendtoHand(g,nil,REASON_EFFECT)
	Duel.ConfirmCards(1-tp,g) end end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)\
	if Duel.GetFieldGroupCount(1-tp,LOCATION_GRAVE,0)>=15 then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1) end end
end