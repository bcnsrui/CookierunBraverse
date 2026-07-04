if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_FIRE,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
end
function s.redcookiefilter(c,tp)
	return c:IsAttribute(ATTRIBUTE_FIRE) and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.alonecon(e,tp)
	local c=e:GetHandler()
	local g=Duel.GetMatchingGroup(s.redcookiefilter,tp,LOCATION_MZONE,0,nil,tp)
	return #g==1 and g:GetFirst()==c
end
function s.alonecon2(e,tp)
	local c=e:GetHandler()
	local g=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,nil,tp)
	return #g==1 and g:GetFirst()==c
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.redcookiefilter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	e:SetLabel(0)
	local c=e:GetHandler()
	if s.alonecon(e,tp) then
		if not Duel.SelectYesNo(tp,aux.Stringid(id,0)) then return end
		Cookie3.Cookiedestroyop(e,tp,eg,ep,ev,re,r,rp,Group.FromCards(c))
		e:SetLabel(1)
	else
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local g=Duel.SelectMatchingCard(tp,s.redcookiefilter,tp,LOCATION_MZONE,0,1,1,nil,tp)
		if #g>0 then
		Cookie3.Cookiedestroyop(e,tp,eg,ep,ev,re,r,rp,g)
		e:SetLabel(1) end end
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=5
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if e:GetLabel()~=1 then e:GetHandler():RemoveCounter(tp,0x1001,1,REASON_EFFECT) return end
	local count=Duel.AnnounceNumber(tp,2,1,0)
	if count>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count) end
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	e:SetLabel(0)
	local c=e:GetHandler()
	if s.alonecon2(e,tp) then
		if not Duel.SelectYesNo(tp,aux.Stringid(id,0)) then return end
		Cookie3.Cookiedestroyop(e,tp,eg,ep,ev,re,r,rp,Group.FromCards(c))
		e:SetLabel(1)
	else
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,1,1,nil,tp)
		if #g>0 then
		Cookie3.Cookiedestroyop(e,tp,eg,ep,ev,re,r,rp,g)
		e:SetLabel(1) end end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if e:GetLabel()~=1 then return end
	local bc=e:GetHandler():GetBattleTarget()
	if bc and bc:IsLocation(LOCATION_MZONE) then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,bc,1) end
end