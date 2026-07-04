if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,1,3)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_EXTRA)
	e1:SetHintTiming(TIMING_BATTLE_PHASE,TIMING_BATTLE_PHASE)
	e1:SetCondition(s.skillcon)
	e1:SetTarget(s.skilltg)
	e1:SetOperation(s.skillop)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xd03)
	c:RegisterEffect(e2)
end
function s.handcookiefilter(c)
	return c:IsRace(RACE_WARRIOR)
end
function s.lv3sumfilter(g)
	return g:GetSum(Card.GetLevel)==3
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
	if chk==0 then
	local g=Duel.GetMatchingGroup(s.handcookiefilter,tp,LOCATION_HAND,0,nil)
	return aux.SelectUnselectGroup(g,e,tp,1,3,s.lv3sumfilter,0)	end
	Duel.SetChainLimit(aux.FALSE)
end
function s.skillop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not c:IsRelateToEffect(e) then return end
	local g=Duel.GetMatchingGroup(s.handcookiefilter,tp,LOCATION_HAND,0,nil)
	local tg=aux.SelectUnselectGroup(g,e,tp,1,3,s.lv3sumfilter,1,tp,aux.Stringid(10060000,6))
	if #tg==0 or tg:GetSum(Card.GetLevel)~=3 then return end
	Duel.ConfirmCards(1-tp,tg)
	Duel.SendtoExtraP(tg,nil,REASON_COST)
	Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,c)
end
function s.ancientbreakfilter(c)
	return c:IsFaceup() and c:IsSetCard(0xc04) and c:IsRace(RACE_WARRIOR) and c:IsLevelAbove(2)
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ALL_COLOR,0,1)
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,0,1)
end
function s.AndCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.ancientbreakfilter,tp,LOCATION_EXTRA,0,nil)>=1
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local ct=Duel.GetMatchingGroupCount(s.ancientbreakfilter,tp,LOCATION_EXTRA,0,nil)
	if ct==0 then return end
	local bc=e:GetHandler():GetBattleTarget()
	if bc and bc:IsLocation(LOCATION_MZONE) then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,bc,ct) end
end