local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd031)
	c:RegisterEffect(e1)
end
function s.treefilter(c)
	return c:IsCode(10064038,10070710)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if c:GetOverlayCount()<=2
	and	Duel.IsExistingMatchingCard(s.treefilter,tp,LOCATION_MZONE+LOCATION_EXTRA,0,1,nil) then
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,c,1) end
end