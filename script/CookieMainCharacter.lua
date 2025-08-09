--쿠키런 브레이버스는 갓겜이다
Cookie={}

--메인 캐릭터 유틸
function Cookie.MainCharacter(c)
	c:EnableCounterPermit(0xa01)
	Cookie.DuelStartMainCharacter(c)
	Cookie.DrawStMainCharacter(c)
	Cookie.MainCharacterEff1(c)
	Cookie.MainCharacterEff2(c)
	Cookie.MainCharacterSpEff(c)
end

--듀얼 개시시의 효과
function Cookie.DuelStartMainCharacter(c)
	local e1=Effect.CreateEffect(c)
	e1:SetProperty(EFFECT_FLAG_UNCOPYABLE+EFFECT_FLAG_CANNOT_DISABLE)
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e1:SetCode(EVENT_PREDRAW)
	e1:SetRange(LOCATION_EXTRA)
	e1:SetCountLimit(1)
	e1:SetOperation(Cookie.DuelStartop)
	c:RegisterEffect(e1)
end
function Cookie.DuelStartop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if Duel.GetTurnPlayer()==tp then
	Duel.SpecialSummon(e:GetHandler(),0,tp,tp,true,true,POS_FACEUP_ATTACK)
	local enemymain=Duel.GetMatchingGroup(nil,1-tp,LOCATION_EXTRA,0,nil):GetFirst()
	Duel.SpecialSummon(enemymain,0,1-tp,1-tp,true,true,POS_FACEUP_ATTACK) end
	
	if c:IsCode(10060000) then return end
	local shuffle=Duel.GetFieldGroup(tp,LOCATION_HAND,0)
	Duel.SendtoDeck(shuffle,nil,SEQ_DECKSHUFFLE,REASON_RULE)
	Duel.ShuffleDeck(tp)
	Duel.Draw(tp,6,REASON_RULE)
	if Duel.SelectYesNo(tp,aux.Stringid(10060000,2)) then
	local shuffle=Duel.GetFieldGroup(tp,LOCATION_HAND,0)
	Duel.SendtoDeck(shuffle,nil,SEQ_DECKSHUFFLE,REASON_RULE)
	Duel.ShuffleDeck(tp)
	Duel.Draw(tp,6,REASON_RULE) end
end

--드로우 스탠바이페이즈 처리
function Cookie.DrawStMainCharacter(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetCode(EFFECT_DRAW_COUNT)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET+EFFECT_FLAG_UNCOPYABLE+EFFECT_FLAG_CANNOT_DISABLE)
	e1:SetRange(LOCATION_EMZONE)
	e1:SetTargetRange(1,0)
	e1:SetValue(0)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetCategory(CATEGORY_DECKDES)
	e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e2:SetCode(EVENT_PHASE+PHASE_DRAW)
	e2:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e2:SetRange(LOCATION_EMZONE)
	e2:SetCountLimit(1)
	e2:SetCondition(Cookie.Resetcon)
	e2:SetOperation(Cookie.Resetop)
	c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetCategory(CATEGORY_DRAW)
	e3:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e3:SetCode(EVENT_PHASE+PHASE_STANDBY)
	e3:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e3:SetRange(LOCATION_EMZONE)
	e3:SetCountLimit(1)
	e3:SetCondition(Cookie.drawcon)
	e3:SetOperation(Cookie.drawop)
	c:RegisterEffect(e3)
end
function Cookie.Resetcon(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetTurnPlayer()==tp
end
function Cookie.ResetPositionfilter(c)
	return c:IsFaceup() and c:IsDefensePos() and not c:IsLocation(LOCATION_EMZONE)
end
function Cookie.Resetop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_MUST_ATTACK)
	e1:SetReset(RESET_PHASE+PHASE_BATTLE_START)
	c:RegisterEffect(e1)
	if Duel.GetTurnCount()==1 and c:IsCode(10060000) then
	local sg=Duel.SelectMatchingCard(1-tp,nil,1-tp,LOCATION_HAND,0,0,3,nil,e,tp)
	Duel.SpecialSummon(sg,0,1-tp,1-tp,false,false,POS_FACEUP_ATTACK)
	local sg2=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,0,2,nil,e,tp)
	Duel.SpecialSummon(sg2,0,tp,tp,false,false,POS_FACEUP_ATTACK)
	sg:Merge(sg2)
	local filtersg=sg:Filter(Card.IsSetCard,nil,0xc02)
	Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,filtersg)
	Duel.RaiseEvent(e:GetHandler(),EVENT_CUSTOM+10060100,e,0,tp,tp,0) end

	if Duel.GetTurnCount()==1 and not c:IsCode(10060000) then
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local sc1=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil,e,tp):GetFirst()
	Duel.SpecialSummon(sc1,0,tp,tp,false,false,POS_FACEDOWN_DEFENSE)
	Duel.Hint(HINT_SELECTMSG,1-tp,HINTMSG_SPSUMMON)
	local sc2=Duel.SelectMatchingCard(1-tp,nil,1-tp,LOCATION_HAND,0,1,1,nil,e,tp):GetFirst()
	Duel.SpecialSummon(sc2,0,1-tp,1-tp,false,false,POS_FACEDOWN_DEFENSE) end

	local sg=Duel.GetMatchingGroup(Cookie.ResetPositionfilter,tp,LOCATION_MZONE,0,nil)
	if #sg>0 then
	Duel.ChangePosition(sg,POS_FACEUP_ATTACK) end
	local resetmana=Duel.GetMatchingGroup(Card.IsFacedown,tp,LOCATION_REMOVED,0,nil)
	if #resetmana>0 then
	Duel.SendtoGrave(resetmana,REASON_RULE|REASON_RETURN)	
	Duel.Remove(resetmana,POS_FACEUP,REASON_RULE) end
end
function Cookie.drawcon(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetTurnPlayer()==tp
end
function Cookie.drawop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if Duel.GetTurnCount()==1 and not c:IsCode(10060000) then
	local sc=Duel.GetMatchingGroup(Card.IsDefensePos,tp,LOCATION_MZONE,0,nil):GetFirst()	
	Duel.SendtoHand(sc,nil,REASON_RULE)
	Duel.SpecialSummon(sc,0,tp,tp,false,false,POS_FACEUP_ATTACK)
	local sc2=Duel.GetMatchingGroup(Card.IsDefensePos,1-tp,LOCATION_MZONE,0,nil):GetFirst()	
	Duel.SendtoHand(sc2,nil,REASON_RULE)
	Duel.SpecialSummon(sc2,0,1-tp,1-tp,false,false,POS_FACEUP_ATTACK) end

	local c=e:GetHandler()
	if Duel.GetTurnCount()~=1 then
	Duel.Draw(tp,1,REASON_EFFECT)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Draw(tp,1,REASON_EFFECT)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp) end
	
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,0))
	local supportcard=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,0,1,nil)
	Duel.Remove(supportcard,POS_FACEUP,REASON_RULE)
	if #supportcard==0 and not Duel.SelectYesNo(tp,aux.Stringid(10060000,1)) then
	local supportcard2=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
	Duel.Remove(supportcard2,POS_FACEUP,REASON_RULE) end
	Duel.SkipPhase(tp,PHASE_MAIN1,RESET_PHASE+PHASE_END,0)
end

--유희왕과 다른 룰1(1메인2스킵,2공격대상안됨,3패매수제한X,4표시형식변경불가,5공격불가,6필드봉인,7전투데미지없음,8선공배페)
function Cookie.MainCharacterEff1(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET+EFFECT_FLAG_CANNOT_DISABLE)
	e1:SetRange(LOCATION_EMZONE)
	e1:SetTargetRange(1,1)
	e1:SetCode(EFFECT_CANNOT_M2)
	c:RegisterEffect(e1)	
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e2:SetCode(EFFECT_CANNOT_BE_BATTLE_TARGET)
	e2:SetRange(LOCATION_EMZONE)
	e2:SetValue(1)
	c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_FIELD)
	e3:SetCode(EFFECT_HAND_LIMIT)
	e3:SetProperty(EFFECT_FLAG_PLAYER_TARGET+EFFECT_FLAG_CANNOT_DISABLE)
	e3:SetRange(LOCATION_EMZONE)
	e3:SetTargetRange(1,0)
	e3:SetValue(100)
	c:RegisterEffect(e3)
	local e4=Effect.CreateEffect(c)
	e4:SetType(EFFECT_TYPE_SINGLE)
	e4:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e4:SetCode(EFFECT_CANNOT_CHANGE_POSITION)
	c:RegisterEffect(e4)
	local e5=Effect.CreateEffect(c)
	e5:SetType(EFFECT_TYPE_SINGLE)
	e5:SetCode(EFFECT_CANNOT_ATTACK)
	e5:SetCondition(Cookie.aatcon)
	c:RegisterEffect(e5)
	local e6=Effect.CreateEffect(c)
	e6:SetType(EFFECT_TYPE_FIELD)
	e6:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE)
	e6:SetRange(LOCATION_EMZONE)
	e6:SetCode(EFFECT_DISABLE_FIELD)
	e6:SetOperation(Cookie.FieldTheRockop)
	c:RegisterEffect(e6)
	local e7=Effect.CreateEffect(c)
	e7:SetType(EFFECT_TYPE_FIELD)
	e7:SetCode(EFFECT_AVOID_BATTLE_DAMAGE)
	e7:SetProperty(EFFECT_FLAG_PLAYER_TARGET+EFFECT_FLAG_IGNORE_IMMUNE+EFFECT_FLAG_CANNOT_DISABLE)
	e7:SetRange(LOCATION_EMZONE)
	e7:SetTargetRange(1,0)
	e7:SetValue(1)
	c:RegisterEffect(e7)
	local e8=Effect.CreateEffect(c)
	e8:SetType(EFFECT_TYPE_FIELD)
	e8:SetProperty(EFFECT_FLAG_PLAYER_TARGET+EFFECT_FLAG_CANNOT_DISABLE)
	e8:SetCode(EFFECT_BP_FIRST_TURN)
	e8:SetRange(LOCATION_EMZONE)
	e8:SetTargetRange(1,1)
	c:RegisterEffect(e8)
end
function Cookie.aatcon(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsBattlePhase()
end
function Cookie.FieldTheRockop(e,tp)
	return 0x15
end


--유희왕과 다른 룰2(1공격력=남은마나,2수비력=총마나,3랭크=브레이크에리어레벨,4승리조건)
function Cookie.MainCharacterEff2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetCode(EFFECT_SET_ATTACK)
	e1:SetRange(LOCATION_EMZONE)
	e1:SetValue(Cookie.restmanaat)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e2:SetCode(EFFECT_SET_DEFENSE)
	e2:SetRange(LOCATION_EMZONE)
	e2:SetValue(Cookie.manaat)
	c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_SINGLE)
	e3:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e3:SetCode(EFFECT_CHANGE_RANK)
	e3:SetRange(LOCATION_EMZONE)
	e3:SetValue(Cookie.brakearealevel)
	c:RegisterEffect(e3)
	local e4=Effect.CreateEffect(c)
	e4:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e4:SetCode(EVENT_ADJUST)
	e4:SetRange(LOCATION_EMZONE)
	e4:SetCondition(Cookie.gameovercon)
	e4:SetOperation(Cookie.gameoverop)
	c:RegisterEffect(e4)	
end
function Cookie.restmanaat(e,c)
	return Duel.GetMatchingGroupCount(Card.IsFaceup,c:GetControler(),LOCATION_REMOVED,0,nil)
end
function Cookie.manaat(e,c)
	return Duel.GetFieldGroupCount(c:GetControler(),LOCATION_REMOVED,0)
end
function Cookie.brakearealevel(e,c)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,c:GetControler(),LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	return ally
end
function Cookie.gameovercon(e)
	local tp=e:GetHandlerPlayer()
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	return ally>=10
end
function Cookie.gameoverop(e,tp,eg,ep,ev,re,r,rp)
	Duel.SetLP(tp,0)
end

--메인 캐릭터 기동효과
--1패정렬,2~3등장유예
function Cookie.MainCharacterSpEff(c)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060002,0))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_EMZONE)
	e1:SetCondition(Cookie.Battleskillcon2)
	e1:SetOperation(Cookie.handop)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e2:SetCode(EVENT_LEAVE_FIELD)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCondition(Cookie.leavecookiecon)
	e2:SetOperation(Cookie.leavecookieop)
	c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_QUICK_F)
	e3:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DAMAGE_CAL+EFFECT_FLAG_DELAY)
	e3:SetCode(EVENT_CHAIN_END)
	e3:SetRange(LOCATION_MZONE)
	e3:SetCondition(Cookie.leavecookiecon2)
	e3:SetTarget(Cookie.notg)
	e3:SetOperation(Cookie.leavecookieop2)
	c:RegisterEffect(e3)
	local e4=Effect.CreateEffect(c)
	e4:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_QUICK_F)
	e4:SetCode(EVENT_DAMAGE_STEP_END)
	e4:SetRange(LOCATION_MZONE)
	e4:SetCondition(Cookie.leavecookiecon2)
	e4:SetTarget(Cookie.notg)
	e4:SetOperation(Cookie.leavecookieop2)
	c:RegisterEffect(e4)
	local e5=Effect.CreateEffect(c)
	e5:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e5:SetCode(EVENT_CHAIN_END)
	e5:SetProperty(EFFECT_FLAG_DAMAGE_STEP+EFFECT_FLAG_DAMAGE_CAL+EFFECT_FLAG_DELAY)
	e5:SetRange(LOCATION_MZONE)
	e5:SetCondition(Cookie.leavecookiecon3)
	e5:SetOperation(Cookie.leavecookieop3)
	c:RegisterEffect(e5)
	local e6=Effect.CreateEffect(c)
	e6:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_O)
	e6:SetCode(EVENT_ATTACK_ANNOUNCE)
	e6:SetHintTiming(TIMING_BATTLE_STEP_END)
	e6:SetRange(LOCATION_MZONE)
	e6:SetCondition(function(_,tp) return Duel.IsTurnPlayer(1-tp) end)
	e6:SetOperation(Cookie.cookienothingop)
	c:RegisterEffect(e6)
end
function Cookie.Battleskillcon2(e)
	local tp=e:GetHandlerPlayer()
	return Duel.GetTurnPlayer()==tp and Duel.GetCurrentPhase()==PHASE_BATTLE_STEP and not e:GetHandler():IsCode(10060000)
	and not (Duel.GetAttacker() and Duel.GetAttacker():IsControler(tp)) and Duel.GetCurrentChain()==0
end
function Cookie.notg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetChainLimit(aux.FALSE)
end
function Cookie.handop(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetFieldGroup(tp,LOCATION_HAND,0)
	local fg1=Duel.GetMatchingGroup(Card.IsRace,tp,LOCATION_HAND,0,nil,RACE_WARRIOR)
	local fg2=Duel.GetMatchingGroup(Card.IsRace,tp,LOCATION_HAND,0,nil,RACE_SPELLCASTER)
	local fg3=Duel.GetMatchingGroup(Card.IsRace,tp,LOCATION_HAND,0,nil,RACE_FAIRY)
	local fg4=Duel.GetMatchingGroup(Card.IsRace,tp,LOCATION_HAND,0,nil,RACE_FIEND)
	Duel.SendtoDeck(fg1,nil,0,REASON_RULE)
	Duel.SendtoDeck(fg2,nil,0,REASON_RULE)
	Duel.SendtoDeck(fg3,nil,0,REASON_RULE)
	Duel.SendtoDeck(fg4,nil,0,REASON_RULE)
	Duel.Draw(tp,#g,REASON_RULE)
end
function Cookie.leavecookiefilter(c,tp)
	return c:IsPreviousLocation(LOCATION_MZONE) and c:IsPreviousControler(tp)
end
function Cookie.leavecookiecon(e,tp,eg,ep,ev,re,r,rp)
	return eg:IsExists(Cookie.leavecookiefilter,1,nil,tp) and Duel.GetCurrentPhase()~=PHASE_STANDBY
end
function Cookie.leavecookieop(e,tp,eg,ep,ev,re,r,rp)
	e:GetHandler():AddCounter(0xa01,1)
end
function Cookie.leavecookiecon2(e,tp,eg,ep,ev,re,r,rp)
	local tp=e:GetHandlerPlayer()
	return Duel.GetCounter(tp,1,1,0xa01)>0 and Duel.GetTurnPlayer()==tp
end
function Cookie.cookiefilter(c)
	return c:IsRace(RACE_WARRIOR)
end
function Cookie.leavecookieop2(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local enemymain=Duel.GetMatchingGroup(nil,1-tp,LOCATION_EMZONE,0,nil):GetFirst()
	if Duel.GetLocationCount(tp,LOCATION_MZONE)>1 then allymin=1 else allymin=0 end
	if Duel.GetLocationCount(1-tp,LOCATION_MZONE)>1 then enemymin=1 else enemymin=0 end	
	local setsg=Group.CreateGroup()
	
	--자신
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local sg=Duel.SelectMatchingCard(tp,Cookie.cookiefilter,tp,LOCATION_HAND,0,allymin,c:GetCounter(0xa01),nil,e,tp)
	if #sg==2 then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,2))
	local sg1=sg:FilterSelect(tp,aux.TRUE,1,1,nil)
	local sg2=sg:RemoveCard(sg1)	
	Duel.SpecialSummon(sg1,0,tp,tp,false,false,POS_FACEUP_ATTACK)
	Duel.SpecialSummon(sg2,0,tp,tp,false,false,POS_FACEUP_ATTACK)
	setsg:Merge(sg1)
	setsg:Merge(sg2) else
	Duel.SpecialSummon(sg,0,tp,tp,false,false,POS_FACEUP_ATTACK)
	setsg:Merge(sg) end
	if Duel.GetLocationCount(tp,LOCATION_MZONE)>1 and c:GetCounter(0xa01)>0 and #sg==0 then Duel.SetLP(tp,0) end
	if c:GetCounter(0xa01)>0 then c:RemoveCounter(tp,0xa01,c:GetCounter(0xa01),REASON_RULE) end
	
	--상대
	Duel.Hint(HINT_SELECTMSG,1-tp,HINTMSG_SPSUMMON)
	local ssg=Duel.SelectMatchingCard(1-tp,Cookie.cookiefilter,1-tp,LOCATION_HAND,0,enemymin,enemymain:GetCounter(0xa01),nil,e,tp)
	if #ssg==2 then
	Duel.Hint(HINT_SELECTMSG,1-tp,aux.Stringid(10060001,2))
	local ssg1=ssg:FilterSelect(1-tp,aux.TRUE,1,1,nil)
	local ssg2=ssg:RemoveCard(ssg1)	
	Duel.SpecialSummon(ssg1,0,1-tp,1-tp,false,false,POS_FACEUP_ATTACK)
	Duel.SpecialSummon(ssg2,0,1-tp,1-tp,false,false,POS_FACEUP_ATTACK)
	setsg:Merge(ssg1)
	setsg:Merge(ssg2) else
	Duel.SpecialSummon(ssg,0,1-tp,1-tp,false,false,POS_FACEUP_ATTACK)
	setsg:Merge(ssg) end
	if Duel.GetLocationCount(1-tp,LOCATION_MZONE)>1 and enemymain:GetCounter(0xa01)>0 and #ssg==0 then Duel.SetLP(1-tp,0) end
	if enemymain:GetCounter(0xa01)>0 then enemymain:RemoveCounter(tp,0xa01,enemymain:GetCounter(0xa01),REASON_RULE) end

	local filtersg=setsg:Filter(Card.IsSetCard,nil,0xc02)
	Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,filtersg)
	Duel.RaiseEvent(e:GetHandler(),EVENT_CUSTOM+10060100,e,0,tp,tp,0)
end
function Cookie.leavecookiecon3(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetTurnPlayer()==tp
end
function Cookie.leavecookieop3(e,tp,eg,ep,ev,re,r,rp)
	Duel.RaiseEvent(e:GetHandler(),EVENT_CUSTOM+10060100,e,0,tp,tp,0)
end
function Cookie.cookienothingop(e,tp,eg,ep,ev,re,r,rp)
end