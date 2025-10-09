--쿠키런 브레이버스의 쿠키들
Cookie2={}

--쿠키 유틸
function Cookie2.CookieCharacter(c,attr,colorCount,mixCount)
	c:EnableCounterPermit(0xa02)
	c:EnableCounterPermit(0xa03)
	Cookie2.CookieEff(c)
	Cookie2.BattleEff(c)
	Cookie2.BattlePosition(c)
	Cookie2.GravePosition(c)
	Cookie2.SupportPosition(c)
	Cookie2.HandPosition(c)
	Cookie2.BrakePosition(c)
	Cookie2.battlemanacost(attr,colorCount,mixCount)(c)
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

--배틀 페이즈 쿠키의 효과(데미지체크)
function Cookie2.BattleEff(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e1:SetCode(EVENT_BATTLE_CONFIRM)
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
end

function Cookie2.BattlePosition(c)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060002,1))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_MZONE)
	e1:SetHintTiming(TIMING_BATTLE_PHASE,TIMING_BATTLE_PHASE)
	e1:SetCondition(Cookie2.BattlePositioncon)
	e1:SetTarget(Cookie3.notg)
	e1:SetOperation(Cookie2.BattlePositionop)
	c:RegisterEffect(e1)
	local e2=e1:Clone()
	e2:SetDescription(aux.Stringid(10061001,0))
	e2:SetProperty(EFFECT_FLAG_BOTH_SIDE)
	e2:SetOperation(Cookie2.Cookiedamageop)
	c:RegisterEffect(e2)
	local e3=e2:Clone()
	e3:SetDescription(aux.Stringid(10061001,1))
	e3:SetOperation(Cookie2.Cookiedamageop2)
	c:RegisterEffect(e3)
	local e4=e2:Clone()
	e4:SetDescription(aux.Stringid(10061001,2))
	e4:SetOperation(Cookie2.Cookiedamageop3)
	c:RegisterEffect(e4)
	local e5=e1:Clone()
	e5:SetDescription(aux.Stringid(10061001,7))
	e5:SetCondition(Cookie2.Cookierestcon)
	e5:SetOperation(Cookie2.Cookierestop)
	c:RegisterEffect(e5)
	local e6=e1:Clone()
	e6:SetDescription(aux.Stringid(10061001,8))
	e6:SetCondition(Cookie2.Cookierestcon2)
	e6:SetOperation(Cookie2.Cookierestop2)
	c:RegisterEffect(e6)
	local e7=e1:Clone()
	e7:SetDescription(aux.Stringid(10061001,9))
	e7:SetOperation(Cookie2.Cookienosumop)
	c:RegisterEffect(e7)
end
function Cookie2.BattlePositioncon(e)
	return Duel.GetCurrentPhase()==PHASE_BATTLE_STEP
end
function Cookie2.Cookiedamageop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,6))
	local count=Duel.AnnounceNumber(tp,0,1,2,3,4,5)
	if c:GetControler()~=tp and not Duel.SelectYesNo(1-tp,aux.Stringid(10061003,12)) then return end
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,c,count)
end
function Cookie2.Cookiedamageop2(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,7))
	local count=Duel.AnnounceNumber(tp,0,1,2,3,4)
	if count==0 then return end
	local opts = {
		aux.Stringid(10061001,5),
		aux.Stringid(10061001,6),
	}
	local sel=Duel.SelectOption(tp,table.unpack(opts))+1
	if sel==1 then
	if c:GetControler()~=tp and not Duel.SelectYesNo(1-tp,aux.Stringid(10061003,8)) then return end
	Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,c,count)
	elseif sel==2 then
	if c:GetControler()~=tp and not Duel.SelectYesNo(1-tp,aux.Stringid(10061003,8)) then return end
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,c,count) end
end
function Cookie2.Cookiedamageop3(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,11))
	local count=Duel.AnnounceNumber(tp,0,1,2,3,4)
	if count==0 then return end
	local opts = {
		aux.Stringid(10061001,3),
		aux.Stringid(10061001,4),
	}
	local sel=Duel.SelectOption(tp,table.unpack(opts))+1
	if sel==1 then
	if Duel.SelectYesNo(tp,aux.Stringid(10061003,9)) then
	if c:GetControler()~=tp and not Duel.SelectYesNo(1-tp,aux.Stringid(10061003,10)) then return end
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,c,count)
	else
	if c:GetControler()~=tp and not Duel.SelectYesNo(1-tp,aux.Stringid(10061003,10)) then return end
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_DAMAGE_CAL,1,c,count) end

	elseif sel==2 then
	if Duel.SelectYesNo(tp,aux.Stringid(10061003,9)) then
	if c:GetControler()~=tp and not Duel.SelectYesNo(1-tp,aux.Stringid(10061003,10)) then return end
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,c,-count)
	else
	if c:GetControler()~=tp and not Duel.SelectYesNo(1-tp,aux.Stringid(10061003,10)) then return end
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_DAMAGE_CAL,1,c,-count) end end
end
function Cookie2.Cookienosumop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.DisableShuffleCheck()
	while c:GetOverlayCount()>0 do
		g=c:GetOverlayGroup()
		last=g:GetFirst()
		tc=g:GetNext()
		for tc in aux.Next(g) do
			if tc:GetSequence()>last:GetSequence() then last=tc end end
		Duel.SendtoDeck(last,nil,SEQ_DECKTOP,REASON_EFFECT) end
	Duel.SendtoHand(c,nil,REASON_EFFECT)
	Duel.ConfirmCards(1-tp,c)
	Duel.ShuffleHand(tp)
end
function Cookie2.Cookierestcon(e)
	return e:GetHandler():IsAttackPos() and Cookie2.BattlePositioncon(e)
end
function Cookie2.Cookierestop(e,tp,eg,ep,ev,re,r,rp)
	Duel.ChangePosition(e:GetHandler(),POS_FACEUP_DEFENSE)
end
function Cookie2.Cookierestcon2(e)
	return e:GetHandler():IsDefensePos() and Cookie2.BattlePositioncon(e)
end
function Cookie2.Cookierestop2(e,tp,eg,ep,ev,re,r,rp)
	Duel.ChangePosition(e:GetHandler(),POS_FACEUP_ATTACK)
end
function Cookie2.BattlePositionop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.DisableShuffleCheck()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,0))
	local opts = {
		aux.Stringid(10061002,12),
		aux.Stringid(10061002,1),
		aux.Stringid(10061002,5),
		aux.Stringid(10061002,6),
		aux.Stringid(10061002,7),
		aux.Stringid(10061002,10),
	}
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,1))
	local sel=Duel.SelectOption(tp,table.unpack(opts))+1
	if sel==1 then return end
	if sel==2 then
		local deckopts = {
			aux.Stringid(10061002,2),
			aux.Stringid(10061002,3),
			aux.Stringid(10061002,4),
		}
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,2))
		local decksel=Duel.SelectOption(tp,table.unpack(deckopts))+1
		if decksel==1 then Duel.SendtoDeck(c,nil,SEQ_DECKSHUFFLE,REASON_EFFECT)
			Duel.ShuffleDeck(tp)
		elseif decksel==2 then 
			Duel.SendtoDeck(c,nil,SEQ_DECKTOP,REASON_EFFECT)
		else 
			Duel.SendtoDeck(c,nil,SEQ_DECKBOTTOM,REASON_EFFECT)
		end
	elseif sel==3 then Duel.SendtoHand(c,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,c)
		Duel.ShuffleHand(tp)
	elseif sel==4 then Duel.Remove(c,POS_FACEUP,REASON_EFFECT)
		Duel.SendtoGrave(c,REASON_EFFECT)
	elseif sel==5 then
		local removeopts = {
			aux.Stringid(10061002,8),
			aux.Stringid(10061002,9),
		}
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,3))
		local removesel=Duel.SelectOption(tp,table.unpack(removeopts))+1
		if removesel==1 then Duel.Remove(c,POS_FACEUP,REASON_EFFECT)
		else local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
		Duel.Overlay(ally,c) end
	elseif sel==6 then Duel.SendtoExtraP(c,nil,REASON_EFFECT) end
end

function Cookie2.GravePosition(c)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060002,1))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_GRAVE)
	e1:SetCondition(Cookie2.GravePositioncon)
	e1:SetTarget(Cookie3.notg)
	e1:SetOperation(Cookie2.GravePositionop)
	c:RegisterEffect(e1)
end
function Cookie2.GravePositioncon(e)
	return e:GetHandler():GetSequence()==0 and Cookie2.BattlePositioncon(e)
end
function Cookie2.GravePositioncon2(e)
	local tp=e:GetHandlerPlayer()
	return e:GetHandler():GetSequence()==0 and Cookie2.BattlePositioncon2(e)
end
function Cookie2.GravePositionop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.DisableShuffleCheck()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,0))
	local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_GRAVE,0,0,99,nil)
	if #g==0 then return end
	local opts = {
		aux.Stringid(10061002,12),
		aux.Stringid(10061002,0),
		aux.Stringid(10061002,1),
		aux.Stringid(10061002,5),
		aux.Stringid(10061002,7),
		aux.Stringid(10061002,10),
		aux.Stringid(10061002,11),
	}
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,1))
	local sel=Duel.SelectOption(tp,table.unpack(opts))+1
	if sel==1 then return end
	if sel==2 and #g==1 and c:IsRace(RACE_WARRIOR) then Duel.SpecialSummon(g,0,tp,tp,false,false,POS_FACEUP_ATTACK)
	elseif sel==2 then
	elseif sel==3 then
		local deckopts = {
			aux.Stringid(10061002,2),
			aux.Stringid(10061002,3),
			aux.Stringid(10061002,4),
		}
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,2))
		local decksel=Duel.SelectOption(tp,table.unpack(deckopts))+1
		if decksel==1 then Duel.SendtoDeck(g,nil,SEQ_DECKSHUFFLE,REASON_EFFECT)
			Duel.ConfirmCards(1-tp,g)
			Duel.ShuffleDeck(tp)
		elseif decksel==2 then 
			Duel.SendtoDeck(g,nil,SEQ_DECKTOP,REASON_EFFECT)
			Duel.ConfirmCards(1-tp,g)
			if #g>1 then Duel.SortDecktop(tp,tp,#g) end
		else 
			Duel.SendtoDeck(g,nil,SEQ_DECKBOTTOM,REASON_EFFECT)
			Duel.ConfirmCards(1-tp,g)
			if #g>1 then Duel.SortDeckbottom(tp,tp,#g) end
		end
	elseif sel==4 then Duel.SendtoHand(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
		Duel.ShuffleHand(tp)
	elseif sel==5 then
		local removeopts = {
			aux.Stringid(10061002,8),
			aux.Stringid(10061002,9),
		}
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,3))
		local removesel=Duel.SelectOption(tp,table.unpack(removeopts))+1
		if removesel==1 then Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
		else local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
		Duel.Overlay(ally,g) end
	elseif sel==6 then Duel.SendtoExtraP(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
	elseif sel==7 and #g==1 then
		if Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,nil,tp)>0 then
			local cookie=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,1,1,nil,tp):GetFirst()
			Duel.SendtoDeck(g,nil,SEQ_DECKTOP,REASON_EFFECT)
			Duel.ConfirmCards(1-tp,g)
			Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,cookie,1)	end
	elseif sel==7 then end
end

function Cookie2.SupportPosition(c)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060002,1))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_REMOVED)
	e1:SetCondition(Cookie2.GravePositioncon)
	e1:SetTarget(Cookie3.notg)
	e1:SetOperation(Cookie2.SupportPositionop)
	c:RegisterEffect(e1)
end
function Cookie2.SupportPositionop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.DisableShuffleCheck()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,0))
	local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_REMOVED,0,0,99,nil)
	if #g==0 then return end
	local opts = {
		aux.Stringid(10061002,12),
		aux.Stringid(10061002,0),
		aux.Stringid(10061002,1),
		aux.Stringid(10061002,5),
		aux.Stringid(10061002,6),
		aux.Stringid(10061002,10),
		aux.Stringid(10061002,11),
	}
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,1))
	local sel=Duel.SelectOption(tp,table.unpack(opts))+1
	if sel==1 then return end
	if sel==2 and #g==1 and c:IsRace(RACE_WARRIOR) then Duel.SpecialSummon(g,0,tp,tp,false,false,POS_FACEUP_ATTACK)
	elseif sel==2 then
	elseif sel==3 then
		local deckopts = {
			aux.Stringid(10061002,2),
			aux.Stringid(10061002,3),
			aux.Stringid(10061002,4),
		}
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,2))
		local decksel=Duel.SelectOption(tp,table.unpack(deckopts))+1
		if decksel==1 then Duel.SendtoDeck(g,nil,SEQ_DECKSHUFFLE,REASON_EFFECT)
			Duel.ConfirmCards(1-tp,g)
			Duel.ShuffleDeck(tp)
		elseif decksel==2 then 
			Duel.SendtoDeck(g,nil,SEQ_DECKTOP,REASON_EFFECT)
			Duel.ConfirmCards(1-tp,g)
			if #g>1 then Duel.SortDecktop(tp,tp,#g) end
		else 
			Duel.SendtoDeck(g,nil,SEQ_DECKBOTTOM,REASON_EFFECT)
			Duel.ConfirmCards(1-tp,g)
			if #g>1 then Duel.SortDeckbottom(tp,tp,#g) end
		end
	elseif sel==4 then Duel.SendtoHand(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
		Duel.ShuffleHand(tp)
	elseif sel==5 then Duel.SendtoGrave(g,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
	elseif sel==6 then Duel.SendtoExtraP(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
	elseif sel==7 and #g==1 then
		if Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,nil,tp)>0 then
			local cookie=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,1,1,nil,tp):GetFirst()
			Duel.SendtoDeck(g,nil,SEQ_DECKTOP,REASON_EFFECT)
			Duel.ConfirmCards(1-tp,g)
			Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,cookie,1)	end
	elseif sel==7 then end
end

function Cookie2.HandPosition(c)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060002,1))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(Cookie2.BattlePositioncon)
	e1:SetTarget(Cookie3.notg)
	e1:SetOperation(Cookie2.HandPositionop)
	c:RegisterEffect(e1)
end
function Cookie2.HandPositionop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.DisableShuffleCheck()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,0))
	local opts = {
		aux.Stringid(10061002,12),
		aux.Stringid(10061002,0),
		aux.Stringid(10061002,1),
		aux.Stringid(10061002,6),
		aux.Stringid(10061002,7),
		aux.Stringid(10061002,10),
		aux.Stringid(10061002,11),
	}
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,1))
	local sel=Duel.SelectOption(tp,table.unpack(opts))+1
	if sel==1 then return end
	if sel==2 and c:IsRace(RACE_WARRIOR) then Duel.SpecialSummon(c,0,tp,tp,false,false,POS_FACEUP_ATTACK)
	elseif sel==2 then
	elseif sel==3 then
		local deckopts = {
			aux.Stringid(10061002,2),
			aux.Stringid(10061002,3),
			aux.Stringid(10061002,4),
		}
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,2))
		local decksel=Duel.SelectOption(tp,table.unpack(deckopts))+1
		if decksel==1 then Duel.SendtoDeck(c,nil,SEQ_DECKSHUFFLE,REASON_EFFECT)
			Duel.ShuffleDeck(tp)
		elseif decksel==2 then 
			Duel.SendtoDeck(c,nil,SEQ_DECKTOP,REASON_EFFECT)
		else 
			Duel.SendtoDeck(c,nil,SEQ_DECKBOTTOM,REASON_EFFECT)
		end
	elseif sel==4 then Duel.SendtoGrave(c,REASON_EFFECT)
	elseif sel==5 then
		local removeopts = {
			aux.Stringid(10061002,8),
			aux.Stringid(10061002,9),
		}
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,3))
		local removesel=Duel.SelectOption(tp,table.unpack(removeopts))+1
		if removesel==1 then Duel.Remove(c,POS_FACEUP,REASON_EFFECT)
		else local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
		Duel.Overlay(ally,c) end
	elseif sel==6 then Duel.SendtoExtraP(c,nil,REASON_EFFECT)
	elseif sel==7 then
		if Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,nil,tp)>0 then
		local cookie=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,1,1,nil,tp):GetFirst()
		Duel.SendtoDeck(c,nil,SEQ_DECKTOP,REASON_EFFECT)
		Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,cookie,1)	end
	end
end

function Cookie2.BrakePosition(c)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060002,1))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_EXTRA)
	e1:SetCondition(Cookie2.BattlePositioncon)
	e1:SetTarget(Cookie3.notg)
	e1:SetOperation(Cookie2.ExtraPositionop)
	c:RegisterEffect(e1)
end
function Cookie2.ExtraPositionop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.DisableShuffleCheck()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,0))
	local opts = {
		aux.Stringid(10061002,12),
		aux.Stringid(10061002,0),
		aux.Stringid(10061002,1),
		aux.Stringid(10061002,5),
		aux.Stringid(10061002,6),
		aux.Stringid(10061002,7),
		aux.Stringid(10061002,11),
	}
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,1))
	local sel=Duel.SelectOption(tp,table.unpack(opts))+1
	if sel==1 then return end
	if sel==2 and c:IsRace(RACE_WARRIOR) then Duel.SendtoGrave(c,REASON_EFFECT)
		Duel.SpecialSummon(c,0,tp,tp,false,false,POS_FACEUP_ATTACK)
	elseif sel==2 then
	elseif sel==3 then
		local deckopts = {
			aux.Stringid(10061002,2),
			aux.Stringid(10061002,3),
			aux.Stringid(10061002,4),
		}
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,2))
		local decksel=Duel.SelectOption(tp,table.unpack(deckopts))+1
		if decksel==1 then Duel.SendtoDeck(c,nil,SEQ_DECKSHUFFLE,REASON_EFFECT)
			Duel.ShuffleDeck(tp)
		elseif decksel==2 then 
			Duel.SendtoDeck(c,nil,SEQ_DECKTOP,REASON_EFFECT)
		else 
			Duel.SendtoDeck(c,nil,SEQ_DECKBOTTOM,REASON_EFFECT)
		end
	elseif sel==4 then Duel.SendtoHand(c,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,c)
		Duel.ShuffleHand(tp)
	elseif sel==5 then Duel.SendtoGrave(c,REASON_EFFECT)
	elseif sel==6 then
		local removeopts = {
			aux.Stringid(10061002,8),
			aux.Stringid(10061002,9),
		}
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,3))
		local removesel=Duel.SelectOption(tp,table.unpack(removeopts))+1
		if removesel==1 then Duel.Remove(c,POS_FACEUP,REASON_EFFECT)
		else local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
		Duel.Overlay(ally,c) end
	elseif sel==7 then
		if Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,nil,tp)>0 then
		local cookie=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,1,1,nil,tp):GetFirst()
		Duel.SendtoDeck(c,nil,SEQ_DECKTOP,REASON_EFFECT)
		Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,cookie,1)	end
	end
end

--쿠키 배틀 마나코스트
function Cookie2.battlemanacost(attr,colorCount,mixCount)
	return function(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ATTACK_COST)
	e1:SetCost(function(e,c,tp)
	local g=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_REMOVED,0,nil)
	return #g>=mixCount and
	aux.SelectUnselectGroup(g,e,tp,mixCount,mixCount,Cookie3.hasColorCount(attr,colorCount),0)
	end)
	e1:SetOperation(function (e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
		if c:IsLocation(LOCATION_MZONE) then
		local g=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_REMOVED,0,nil)
		local tg=aux.SelectUnselectGroup(g,e,tp,mixCount,mixCount,Cookie3.hasColorCount(attr,colorCount),1,tp,aux.Stringid(10060000,4))
		local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
		Duel.Overlay(ally,tg)
		Duel.ChangePosition(c,POS_FACEUP_DEFENSE)
		Duel.AttackCostPaid() end
end)
	c:RegisterEffect(e1) end
end