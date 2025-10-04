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
	e2:SetCondition(function(_,tp) return Duel.GetTurnPlayer()==tp end)
	e2:SetOperation(Cookie.Resetop)
	c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetCategory(CATEGORY_DRAW)
	e3:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e3:SetCode(EVENT_PHASE+PHASE_STANDBY)
	e3:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e3:SetRange(LOCATION_EMZONE)
	e3:SetCountLimit(1)
	e3:SetCondition(function(_,tp) return Duel.GetTurnPlayer()==tp end)
	e3:SetOperation(Cookie.drawop)
	c:RegisterEffect(e3)
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
	local sg=Duel.SelectMatchingCard(1-tp,Cookie.cookiefilter,1-tp,LOCATION_HAND,0,0,3,nil,e,tp)
	Duel.SpecialSummon(sg,0,1-tp,1-tp,false,false,POS_FACEUP_ATTACK)
	local sg2=Duel.SelectMatchingCard(tp,Cookie.cookiefilter,tp,LOCATION_HAND,0,0,2,nil,e,tp)
	Duel.SpecialSummon(sg2,0,tp,tp,false,false,POS_FACEUP_ATTACK) end

	if Duel.GetTurnCount()==1 and not c:IsCode(10060000) then
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local sc1=Duel.SelectMatchingCard(tp,Cookie.cookiefilter,tp,LOCATION_HAND,0,1,1,nil,e,tp):GetFirst()
	Duel.SpecialSummon(sc1,0,tp,tp,false,false,POS_FACEDOWN_DEFENSE)
	Duel.Hint(HINT_SELECTMSG,1-tp,HINTMSG_SPSUMMON)
	local sc2=Duel.SelectMatchingCard(1-tp,Cookie.cookiefilter,1-tp,LOCATION_HAND,0,1,1,nil,e,tp):GetFirst()
	Duel.SpecialSummon(sc2,0,1-tp,1-tp,false,false,POS_FACEDOWN_DEFENSE) end

	local sg=Duel.GetMatchingGroup(Cookie.ResetPositionfilter,tp,LOCATION_MZONE,0,nil)
	if #sg>0 then
	Duel.ChangePosition(sg,POS_FACEUP_ATTACK) end
	local resetmana=c:GetOverlayGroup()
	if #resetmana>0 then Duel.Remove(resetmana,POS_FACEUP,REASON_RULE) end
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

	if Duel.GetTurnCount()~=1 then
	Duel.Draw(tp,1,REASON_EFFECT)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Draw(tp,1,REASON_EFFECT)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp) end
	
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,0))
	local supportcard=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,0,1,nil)
	Duel.Remove(supportcard,POS_FACEUP,REASON_RULE)
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
	e5:SetCondition(function(_,tp) return Duel.IsBattlePhase() end)
	c:RegisterEffect(e5)
	local e6=Effect.CreateEffect(c)
	e6:SetType(EFFECT_TYPE_FIELD)
	e6:SetProperty(EFFECT_FLAG_REPEAT+EFFECT_FLAG_CANNOT_DISABLE)
	e6:SetRange(LOCATION_EMZONE)
	e6:SetCode(EFFECT_DISABLE_FIELD)
	e6:SetOperation(function(_,tp) return 0x15 end)
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

--유희왕과 다른 룰2(1공격력=남은마나,2수비력=총마나,3랭크=브레이크에리어레벨,4승리조건,5덱0장)
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
	local e5=Effect.CreateEffect(c)
	e5:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e5:SetProperty(EFFECT_FLAG_IGNORE_IMMUNE+EFFECT_FLAG_CANNOT_DISABLE)
	e5:SetRange(LOCATION_EMZONE)
	e5:SetCode(EVENT_ADJUST)
	e5:SetCondition(Cookie.Refreshcon)
	e5:SetOperation(Cookie3.Refreshop)
	c:RegisterEffect(e5)
end
function Cookie.restmanaat(e,c)
	return Duel.GetFieldGroupCount(c:GetControler(),LOCATION_REMOVED,0)
end
function Cookie.manaat(e,c)
	return Duel.GetFieldGroupCount(c:GetControler(),LOCATION_REMOVED,0)+c:GetOverlayCount()
end
function Cookie.brakearealevel(e,c)
	local tp=e:GetHandlerPlayer()
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	return ally
end
function Cookie.gameovercon(e)
	local tp=e:GetHandlerPlayer()
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	return ally>=10
end
function Cookie.gameoverop(e,tp,eg,ep,ev,re,r,rp)
	Duel.SetLP(tp,10)
end
function Cookie.Refreshcon(e)
	return Duel.GetFieldGroupCount(e:GetHandlerPlayer(),LOCATION_DECK,0)==0
end

--메인 캐릭터 기동효과
--1패정렬,2등장카운터,3쿠키등장,45코스트지불회수,6덱맨위
function Cookie.MainCharacterSpEff(c)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060002,0))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_EMZONE)
	e1:SetCondition(Cookie2.BattlePositioncon)
	e1:SetTarget(Cookie3.notg)
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
	e3:SetDescription(aux.Stringid(10060002,8))
	e3:SetType(EFFECT_TYPE_QUICK_O)
	e3:SetCode(EVENT_FREE_CHAIN)
	e3:SetRange(LOCATION_EMZONE)
	e3:SetCondition(Cookie.mainskillcon)
	e3:SetTarget(Cookie3.notg)
	e3:SetOperation(Cookie.leavecookieop2)
	c:RegisterEffect(e3)
	local e4=Effect.CreateEffect(c)
	e4:SetDescription(aux.Stringid(10060002,9))
	e4:SetType(EFFECT_TYPE_QUICK_O)
	e4:SetCode(EVENT_FREE_CHAIN)
	e4:SetProperty(EFFECT_FLAG_DAMAGE_CAL)
	e4:SetRange(LOCATION_EMZONE)
	e4:SetCondition(Cookie.cookiemanacon)
	e4:SetTarget(Cookie3.notg)
	e4:SetOperation(Cookie.cookiemanaop)
	c:RegisterEffect(e4)
	local e5=Effect.CreateEffect(c)
	e5:SetDescription(aux.Stringid(10060002,10))
	e5:SetType(EFFECT_TYPE_QUICK_O)
	e5:SetCode(EVENT_FREE_CHAIN)
	e5:SetProperty(EFFECT_FLAG_DAMAGE_CAL)
	e5:SetRange(LOCATION_EMZONE)
	e5:SetCondition(Cookie.cookiemanacon2)
	e5:SetTarget(Cookie3.notg)
	e5:SetOperation(Cookie.cookiemanaop2)
	c:RegisterEffect(e5)
	local e6=Effect.CreateEffect(c)
	e6:SetDescription(aux.Stringid(10060002,11))
	e6:SetType(EFFECT_TYPE_QUICK_O)
	e6:SetCode(EVENT_FREE_CHAIN)
	e6:SetProperty(EFFECT_FLAG_DAMAGE_CAL)
	e6:SetRange(LOCATION_EMZONE)
	e6:SetCondition(Cookie2.BattlePositioncon)
	e6:SetTarget(Cookie3.notg)
	e6:SetOperation(Cookie.maincookieop)
	c:RegisterEffect(e6)
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
function Cookie.cookiefilter(c)
	return c:IsRace(RACE_WARRIOR)
end
function Cookie.mainskillcon(e)
	local tp=e:GetHandlerPlayer()
	local c=e:GetHandler()
	local enemymain=Duel.GetMatchingGroup(nil,1-tp,LOCATION_EMZONE,0,nil):GetFirst()
	return (c:GetCounter(0xa01)>0 or enemymain:GetCounter(0xa01)>0) and Cookie2.BattlePositioncon(e)
end
function Cookie.leavecookieop2(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local enemymain=Duel.GetMatchingGroup(nil,1-tp,LOCATION_EMZONE,0,nil):GetFirst()
	
	local allyzones=Duel.GetLocationCount(tp,LOCATION_MZONE)
	local enemyzones=Duel.GetLocationCount(1-tp,LOCATION_MZONE)
	local allycounter=c:GetCounter(0xa01)
	local enemycounter=enemymain:GetCounter(0xa01)

	local allymin=0
	local enemymin=0
	if allyzones==2 and allycounter>0 then allymin=1 end
	if enemyzones==2 and enemycounter>0 then enemymin=1 end
	
	local allymax=math.min(allycounter,allyzones,2)
	local enemymax=math.min(enemycounter,enemyzones,2)
	
	if allycounter>0 then Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,1))
		local sg=Duel.SelectMatchingCard(tp,Cookie.cookiefilter,tp,LOCATION_HAND,0,allymin,allymax,nil,e,tp)
		if #sg>0 then Duel.SpecialSummon(sg,0,tp,tp,false,false,POS_FACEUP_ATTACK) end
		c:RemoveCounter(tp,0xa01,c:GetCounter(0xa01),REASON_RULE) end
	
	if enemycounter>0 then Duel.Hint(HINT_SELECTMSG,1-tp,aux.Stringid(10060000,1))
		local ssg=Duel.SelectMatchingCard(1-tp,Cookie.cookiefilter,1-tp,LOCATION_HAND,0,enemymin,enemymax,nil,e,tp)
		if #ssg>0 then Duel.SpecialSummon(ssg,0,1-tp,1-tp,false,false,POS_FACEUP_ATTACK) end
		enemymain:RemoveCounter(tp,0xa01,enemymain:GetCounter(0xa01),REASON_RULE) end
end
function Cookie.cookiemanaop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060002,9))
	local sg=Duel.SelectMatchingCard(tp,Card.IsFaceup,tp,LOCATION_REMOVED,0,0,99,nil)
	Duel.Overlay(c,sg)
end
function Cookie.cookiemanacon(e)
	local c=e:GetHandler()
	return Duel.GetFieldGroupCount(c:GetControler(),LOCATION_REMOVED,0)>0 and Cookie2.BattlePositioncon(e)
end
function Cookie.cookiemanacon2(e)
	local c=e:GetHandler()
	return c:GetOverlayCount()>0 and Cookie2.BattlePositioncon(e)
end
function Cookie.cookiemanaop2(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local g=c:GetOverlayGroup()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060002,10))
	local sg=g:Select(tp,0,99,nil)
	Duel.Remove(sg,POS_FACEUP,REASON_RULE)
end
function Cookie.maincookiecon(e)
	local tp=e:GetHandlerPlayer()
	return Duel.GetCurrentPhase()==PHASE_BATTLE_STEP
end
function Cookie.maincookieop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.DisableShuffleCheck()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,4))
	local count=Duel.AnnounceNumber(tp,0,1,2,3,4,5,6,7,8,9,10)
	if count==0 then return end
	local g=Duel.GetDecktopGroup(tp,count)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,0))
	local sg=g:Select(tp,0,count,nil)
	local rest=g:Clone()
	rest:Sub(sg)
	if #sg>0 then
	local opts = {
		aux.Stringid(10061002,12),
		aux.Stringid(10061002,5),
		aux.Stringid(10061002,6),
		aux.Stringid(10061002,7),
		aux.Stringid(10061002,10),
	}
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,1))
	local sel=Duel.SelectOption(tp,table.unpack(opts))+1
	if sel==1 then
	elseif sel==2 then Duel.SendtoHand(sg,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,sg)
		Duel.ShuffleHand(tp)
	elseif sel==3 then Duel.SendtoGrave(sg,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,sg)
	elseif sel==4 then
		local removeopts = {
			aux.Stringid(10061002,8),
			aux.Stringid(10061002,9),
		}
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,3))
		local removesel=Duel.SelectOption(tp,table.unpack(removeopts))+1
		if removesel==1 then Duel.Remove(sg,POS_FACEUP,REASON_EFFECT)
		else local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
		Duel.Overlay(ally,sg) end
	elseif sel==5 then Duel.SendtoExtraP(sg,nil,REASON_EFFECT) end end
	if #rest==0 then return end
	local opts2 = {
		aux.Stringid(10061002,1),
		aux.Stringid(10061002,5),
		aux.Stringid(10061002,6),
		aux.Stringid(10061002,7),
		aux.Stringid(10061002,10),
	}
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,5))
	local sel2=Duel.SelectOption(tp,table.unpack(opts2))+1
	if sel2==1 then
	local deckopts = {
		aux.Stringid(10061002,2),
		aux.Stringid(10061002,3),
		aux.Stringid(10061002,4),
	}
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,2))
	local decksel=Duel.SelectOption(tp,table.unpack(deckopts))+1
	if decksel==1 then Duel.SendtoDeck(rest,nil,SEQ_DECKSHUFFLE,REASON_EFFECT)
		Duel.ShuffleDeck(tp)
	elseif decksel==2 then 
		Duel.SendtoDeck(rest,nil,SEQ_DECKTOP,REASON_EFFECT)
		if #rest>1 then Duel.SortDecktop(tp,tp,#rest) end
	else 
		Duel.SendtoDeck(rest,nil,SEQ_DECKBOTTOM,REASON_EFFECT)
		if #rest>1 then Duel.SortDeckbottom(tp,tp,#rest) end
	end
	elseif sel2==2 then Duel.SendtoHand(rest,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,rest)
		Duel.ShuffleHand(tp)
	elseif sel2==3 then Duel.SendtoGrave(rest,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,rest)
	elseif sel2==4 then
		local removeopts = {
			aux.Stringid(10061002,8),
			aux.Stringid(10061002,9),
		}
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,3))
		local removesel2=Duel.SelectOption(tp,table.unpack(removeopts))+1
		if removesel2==1 then Duel.Remove(rest,POS_FACEUP,REASON_EFFECT)
		else local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
		Duel.Overlay(ally,rest) end
	elseif sel2==5 then Duel.SendtoExtraP(rest,nil,REASON_EFFECT) end
end