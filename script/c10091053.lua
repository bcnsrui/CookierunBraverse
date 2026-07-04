if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WIND,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
end
function s.hp5filter(c,tp)
	return c:GetOverlayCount()>=5 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(s.hp5filter,tp,0,LOCATION_MZONE,nil,tp)
	if #g>0 then Cookie7.Allhptrasheff(e,tp,eg,ep,ev,re,r,rp,g,1) end
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	local ally=Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local enemy=Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)
	return ally<enemy
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler())
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local dt=Duel.GetDecktopGroup(tp,1)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally and #dt>0 then Duel.Overlay(ally,dt) end
end