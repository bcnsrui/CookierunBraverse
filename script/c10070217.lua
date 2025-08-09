local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ItemEffect(c)
	e1:SetCondition(s.condition)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
	if not s.global_check then s.global_check=true
		local ge1=Effect.CreateEffect(c)
		ge1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		ge1:SetCode(EVENT_DESTROYED)
		ge1:SetOperation(s.check)
		Duel.RegisterEffect(ge1,0)
	end
end
function s.check(e,tp,eg,ep,ev,re,r,rp)
	for tc in aux.Next(eg) do
	if tc:IsPreviousLocation(LOCATION_MZONE) and tc:IsLocation(LOCATION_EXTRA)
	and tc:GetPreviousControler()==1-tp then
	Duel.RegisterFlagEffect(tp,id,RESET_PHASE+PHASE_END,0,1) end end
end
function s.condition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFlagEffect(tp,id)>0
end
function s.filter(c)
	return c:IsLevel(1)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return
	Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_LIGHT,1,1) end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,1,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.filter,tp,LOCATION_EXTRA,0,0,1,nil)
	Duel.SendtoGrave(ag,REASON_EFFECT)
end