if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,1,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_LIGHT,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
end
function s.ancientfilter(c,exc)
	return c~=exc and c:IsSetCard(0xc04) and c:IsRace(RACE_WARRIOR)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	return c:GetOverlayCount()<=4 and Duel.IsExistingMatchingCard(s.ancientfilter,tp,LOCATION_MZONE,0,1,c)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),1)
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():GetOverlayCount()>=1
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie7.hpdecktop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),1)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local bc=e:GetHandler():GetBattleTarget()
	if bc then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,bc,1) end
end