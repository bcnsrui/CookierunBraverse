if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,2)
	Cookie6.DefenseEffect(c,0,ATTRIBUTE_LIGHT,1,1)
end
function s.Defensecost(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	return Duel.GetAttackTarget()==c
end
function s.Defenseoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd071)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_DAMAGE,1)
	c:RegisterEffect(e1)
end