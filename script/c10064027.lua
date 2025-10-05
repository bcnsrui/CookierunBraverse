local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,3)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10061009,0))
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e1:SetCode(EVENT_ATTACK_ANNOUNCE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCondition(s.blockercookiecon)
	e1:SetOperation(s.blockercookieop)
	c:RegisterEffect(e1)
end
function s.blockercookiecon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local bt=Duel.GetAttackTarget()
	return c~=bt and bt:GetControler()==c:GetControler() and c:IsAttackPos()
end
function s.blockercookieop(e,tp,eg,ep,ev,re,r,rp)
	if Duel.SelectYesNo(tp,aux.Stringid(10061009,0)) then
	Duel.ChangePosition(e:GetHandler(),POS_FACEUP_DEFENSE)
	Duel.ChangeAttackTarget(e:GetHandler()) end
end