--쿠키런 브레이버스의 쿠키들
Cookie2={}

--쿠키 유틸
function Cookie2.CookieCharacter(c)
	c:EnableCounterPermit(0xa02)
	c:EnableCounterPermit(0xa03)
	Cookie2.SummonCookie(c)
	Cookie2.CookieEff(c)
	Cookie2.CookieEff2(c)
	Cookie2.BattleEff(c)
end

--쿠키 소환
function Cookie2.SummonCookie(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_QUICK_O+EFFECT_TYPE_CONTINUOUS)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(Cookie2.Summoncon)
	e1:SetOperation(Cookie2.Summonop)
	c:RegisterEffect(e1)
end
function Cookie2.Summoncon(e)
	local tp=e:GetHandlerPlayer()
	return Duel.GetLocationCount(tp,LOCATION_MZONE)>0 and Duel.GetTurnPlayer()==tp and Duel.GetCurrentPhase()==PHASE_BATTLE_STEP
	and not (Duel.GetAttacker() and Duel.GetAttacker():IsControler(tp)) and Duel.GetCurrentChain()==0
end
function Cookie2.Summonop(e,tp,eg,ep,ev,re,r,rp)
	Duel.SpecialSummon(e:GetHandler(),0,tp,tp,false,false,POS_FACEUP_ATTACK)
	if e:GetHandler():IsSetCard(0xc02) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler()) end
	Duel.RaiseEvent(e:GetHandler(),EVENT_CUSTOM+10060100,e,0,tp,tp,0)
end

--유희왕과 다른 룰(1표시형식변경불가,2수비공격가능,3~4무량공격,5체력은수비력,6hp채우기,7전투파괴X)
function Cookie2.CookieEff(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e1:SetCode(EFFECT_CANNOT_CHANGE_POSITION)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e2:SetCode(EFFECT_DEFENSE_ATTACK)
	e2:SetValue(1)
	c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
    e3:SetType(EFFECT_TYPE_SINGLE)
	e3:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
    e3:SetCode(EFFECT_EXTRA_ATTACK)
    e3:SetValue(100)
    c:RegisterEffect(e3)
	local e4=Effect.CreateEffect(c)
    e4:SetType(EFFECT_TYPE_SINGLE)
	e4:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e4:SetCode(EFFECT_CANNOT_ATTACK_ANNOUNCE)
	e4:SetCondition(Cookie2.atcon)
	c:RegisterEffect(e4)
	local e5=Effect.CreateEffect(c)
	e5:SetType(EFFECT_TYPE_SINGLE)
	e5:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e5:SetCode(EFFECT_SET_DEFENSE)
	e5:SetRange(LOCATION_MZONE)
	e5:SetValue(Cookie2.hpval)
	c:RegisterEffect(e5)
	local e6=Effect.CreateEffect(c)
	e6:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e6:SetCode(EVENT_SPSUMMON_SUCCESS)
	e6:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e6:SetOperation(Cookie2.hpop)
	c:RegisterEffect(e6)
	local e7=Effect.CreateEffect(c)
	e7:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e7:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e7:SetCode(EFFECT_DESTROY_REPLACE)
	e7:SetRange(LOCATION_MZONE)
	e7:SetTarget(Cookie2.NoBtDestroy)
	c:RegisterEffect(e7)
end
function Cookie2.atcon(e,tp,eg,ep,ev,re,r,rp)
	local tp=e:GetHandlerPlayer()
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally:IsCode(10060000) then return e:GetHandler():IsDefensePos()
	else return e:GetHandler():IsDefensePos() or Duel.GetTurnCount()==1 end
end
function Cookie2.hpval(e,c)
	return c:GetOverlayGroup():GetCount()
end
function Cookie2.hpop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local hp=c:GetBaseDefense()
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,c,hp)
end
function Cookie2.NoBtDestroy(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	if chk==0 then return c:IsReason(REASON_BATTLE) and not c:IsReason(REASON_REPLACE) end
	return true
end

--유희왕과 다른 룰2(1효과적용순서리셋)
function Cookie2.CookieEff2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e1:SetCode(EVENT_MOVE)
	e1:SetOperation(Cookie8.resetevent)
	c:RegisterEffect(e1)
end

--배틀 페이즈 쿠키의 효과(1데미지체크,2턴P기절체크,3비턴P기절체크)
function Cookie2.BattleEff(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e1:SetCode(EVENT_BATTLE_START)
	e1:SetCondition(Cookie2.damagecon)
	e1:SetOperation(Cookie2.damagecheck)
	c:RegisterEffect(e1)
end
function Cookie2.damagecon(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler()==Duel.GetAttacker()
end
function Cookie2.damagecheck(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local bc=c:GetBattleTarget()
	local dam=c:GetAttack()
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,bc,dam)
	Duel.RaiseEvent(c,EVENT_CUSTOM+10060100,e,0,tp,tp,0)
	local code=c:GetCode()
	local gtbl=_G["c" .. code]
	if gtbl and type(gtbl.andoperation) == "function" then
	local e1=Effect.CreateEffect(c)
	gtbl.andoperation(e,tp,eg,ep,ev,re,r,rp) end
end

--쿠키 배틀 마나코스트
function Cookie2.battlemanacost(attr,colorCount,mixCount)
	return function(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ATTACK_COST)
	e1:SetCost(function(e,c,tp)
	local c=e:GetHandler()
	local g=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_REMOVED,0,nil)
	return #g>=mixCount and
	aux.SelectUnselectGroup(g,e,tp,mixCount,mixCount,Cookie3.hasColorCount(attr,colorCount),0)
end)
	e1:SetOperation(function (e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
		if c:IsLocation(LOCATION_MZONE) then
		local g=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_REMOVED,0,nil)
		local tg=aux.SelectUnselectGroup(g,e,tp,mixCount,mixCount,Cookie3.hasColorCount(attr,colorCount),1,tp,aux.Stringid(10060000,4))
		Duel.SendtoGrave(tg,REASON_RULE|REASON_RETURN)
		Duel.Remove(tg,POS_FACEDOWN,REASON_RULE)
		Duel.ChangePosition(c,POS_FACEUP_DEFENSE)
		Duel.AttackCostPaid()
	end
end)
	c:RegisterEffect(e1)
	end
end