if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,2,3)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10061009,0))
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e1:SetCode(EVENT_ATTACK_ANNOUNCE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCondition(s.blockercookiecon)
	e1:SetOperation(s.blockercookieop)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xc04)
	c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e3:SetCode(EVENT_BATTLE_CONFIRM)
	e3:SetCountLimit(1)
	e3:SetCondition(s.dmcon)
	e3:SetOperation(s.dmop)
	c:RegisterEffect(e3)
end
function s.blockercookiecon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local bt=Duel.GetAttackTarget()
	return c~=bt and bt:GetControler()==c:GetControler() and c:IsAttackPos()
	and Duel.GetMatchingGroupCount(Card.IsSetCard,tp,0,LOCATION_MZONE,nil,0xa01)==0
end
function s.blockercookieop(e,tp,eg,ep,ev,re,r,rp)
	if Duel.SelectYesNo(tp,aux.Stringid(10061009,0)) then
	Duel.ChangePosition(e:GetHandler(),POS_FACEUP_DEFENSE)
	Duel.ChangeAttackTarget(e:GetHandler()) end
end
function s.dmcon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local a=Duel.GetAttacker()
	return Duel.GetAttackTarget()==c and a and a:IsControler(1-tp) and a:IsLevel(1)
end
function s.dmop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd071)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_DAMAGE,1)
	c:RegisterEffect(e1)
end
