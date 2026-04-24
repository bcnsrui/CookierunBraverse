if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WATER,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=5
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local count=Duel.AnnounceNumber(tp,1,0)
	if count==1 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,chk,ALL_COLOR,2,2)
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,2,2)
end
function s.AndCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil,tp)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)
	Cookie7.Alldamageeff(e,tp,eg,ep,ev,re,r,rp,g,1)
end