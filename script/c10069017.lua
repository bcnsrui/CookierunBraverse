if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,1,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_FIRE,0,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd031)
	c:RegisterEffect(e1)
end
function s.ancientfilter(c,exc)
	return c~=exc and c:IsSetCard(0xc04) and c:IsRace(RACE_WARRIOR)
end
function s.ancientfilter2(c)
	return c:IsSetCard(0xc04) and c:IsRace(RACE_WARRIOR)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.ancientfilter,tp,LOCATION_MZONE,0,1,nil,e:GetHandler())
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,e:GetHandler(),2)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local g=Duel.GetMatchingGroup(s.ancientfilter2,tp,LOCATION_ALL,0,nil)
	for tc in aux.Next(g) do
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd052)
	e1:SetReset(RESET_PHASE+PHASE_END,2)
	tc:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xd062)
	e2:SetReset(RESET_PHASE+PHASE_END,2)
	tc:RegisterEffect(e2) end
end