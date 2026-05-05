if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	c:EnableCounterPermit(0x1000)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060000,9))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(Cookie6.Itemcon)
	e1:SetTarget(s.StageSettingcost)
	e1:SetOperation(s.StageSettingoperation)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(10060000,9))
	e2:SetType(EFFECT_TYPE_QUICK_O)
	e2:SetCode(EVENT_FREE_CHAIN)
	e2:SetRange(LOCATION_FZONE)
	e2:SetProperty(EFFECT_FLAG_BOTH_SIDE)
	e2:SetHintTiming(TIMING_BATTLE_PHASE,TIMING_BATTLE_PHASE)
	e2:SetCondition(s.Stagecon)
	e2:SetTarget(s.Stagecost)
	e2:SetOperation(s.Stageoperation)
	c:RegisterEffect(e2)
end
function s.StageSettingcost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ATTRIBUTE_DARK,1,1) end
	Duel.SetChainLimit(aux.FALSE)
end
function s.StageSettingoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_DARK,1,1)
	Duel.MoveToField(e:GetHandler(),tp,tp,LOCATION_FZONE,POS_FACEUP,true)
end
function s.Stagecon(e)
	local tp=e:GetHandlerPlayer()
	return e:GetHandler():GetCounter(0x1000)==0 and Duel.GetCurrentPhase()==PHASE_BATTLE_STEP
	and not (Duel.GetAttacker() and Duel.GetAttacker():IsControler(tp))
end
function s.Stagecost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,chk,ALL_COLOR,1,1) end
	Duel.SetChainLimit(aux.FALSE)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,1,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,g,1) end
	e:GetHandler():AddCounter(0x1000,1)
end