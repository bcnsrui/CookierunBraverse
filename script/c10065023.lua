if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_LIGHT,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd031)
	c:RegisterEffect(e1)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return e:GetHandler():GetOverlayCount()>=3
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),3)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,e:GetHandler(),2)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if e:GetHandler():GetOverlayCount()<=3 then
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),1)	end
end