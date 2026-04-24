if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,4,4)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_EXTRA)
	e1:SetHintTiming(TIMING_BATTLE_PHASE,TIMING_BATTLE_PHASE)
	e1:SetCountLimit(1,id,EFFECT_COUNT_CODE_DUEL)
	e1:SetCondition(s.skillcon)
	e1:SetTarget(s.skilltg)
	e1:SetOperation(s.skillop)
	c:RegisterEffect(e1)
end
function s.skillcon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	return c:IsFaceup() and Duel.GetTurnPlayer()==tp
		and Duel.GetCurrentPhase()==PHASE_BATTLE_STEP
		and not (Duel.GetAttacker() and Duel.GetAttacker():IsControler(tp))
		and Duel.GetCurrentChain()==0
		and Duel.GetLocationCount(tp,LOCATION_MZONE)>0
end
function s.skilltg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_LIGHT,1,1) end
	Duel.SetChainLimit(aux.FALSE)
end
function s.skillop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not c:IsRelateToEffect(e) then return end
	if not Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ATTRIBUTE_LIGHT,1,1) then return end
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,1,1)
	Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,c)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,c,1)
end
