local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.BSCookieEffect(c,ATTRIBUTE_LIGHT,2,2)
	e1:SetCondition(s.condition)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.condition(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local bt=Duel.GetAttackTarget()
	return bt:IsFaceup() and bt:GetControler()==c:GetControler()
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return
	Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_LIGHT,1,1) end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,1,1)
	local at=Duel.GetAttacker()
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_DAMAGE_CAL,1,at,-1)
end