local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.StageEffect(c,ATTRIBUTE_WIND,1,1)
	e1:SetCountLimit(1)
	e1:SetCondition(s.condition)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
	if not s.global_check then s.global_check=true
		local ge1=Effect.CreateEffect(c)
		ge1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		ge1:SetCode(EVENT_MOVE)
		ge1:SetOperation(s.check)
		Duel.RegisterEffect(ge1,0)
	end
end
function s.condition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFlagEffect(tp,id)>0
end
function s.check(e,tp,eg,ep,ev,re,r,rp)
	for tc in aux.Next(eg) do
	if tc:IsPreviousLocation(LOCATION_REMOVED) and not tc:IsLocation(LOCATION_REMOVED) 
	and tc:GetPreviousControler()==tp then Duel.RegisterFlagEffect(tp,id,RESET_PHASE+PHASE_END,0,1) end end
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	if not Duel.IsExistingMatchingCard(Card.IsFacedown,tp,LOCATION_REMOVED,0,1,nil) then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local mana2=Duel.SelectMatchingCard(tp,Card.IsFacedown,tp,LOCATION_REMOVED,0,1,1,nil)
	Duel.SendtoGrave(mana2,REASON_EFFECT)
	Duel.Remove(mana2,POS_FACEUP,REASON_EFFECT)
end