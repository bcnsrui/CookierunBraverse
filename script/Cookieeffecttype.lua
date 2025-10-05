--쿠키의 효과처리 타입
Cookie6={}

--I아이템
function Cookie6.ItemEffect(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060000,7))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(Cookie2.Itemcon)
	e1:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
		if chk==0 then return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,attr,colorCount,mixCount) end
		Duel.SetChainLimit(aux.FALSE) end)
	e1:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
		Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
		Duel.SendtoGrave(e:GetHandler(),REASON_RULE) end)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(10060000,10))
	e2:SetType(EFFECT_TYPE_QUICK_O)
	e2:SetCode(EVENT_FREE_CHAIN)
	e2:SetRange(LOCATION_HAND)
	e2:SetCondition(Cookie2.Itemcon)
	e2:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
		if chk==0 then return not Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,attr,colorCount,mixCount) end		
		Duel.SetChainLimit(aux.FALSE) end)
	c:RegisterEffect(e2)
	Cookie2.GravePosition(c)
	Cookie2.SupportPosition(c)
	Cookie2.HandPosition(c)
	Cookie2.BrakePosition(c)
end
function Cookie2.Itemcon(e)
	local tp=e:GetHandlerPlayer()
	return Duel.GetTurnPlayer()==tp and Duel.GetCurrentPhase()==PHASE_BATTLE_STEP
	and not (Duel.GetAttacker() and Duel.GetAttacker():IsControler(tp))
end

--T트랩
function Cookie6.TrapEffect(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060000,8))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(Cookie2.Trapcon)
	e1:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
		if chk==0 then return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,attr,colorCount,mixCount) end
		Duel.SetChainLimit(aux.FALSE) end)
	e1:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
		Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
		Duel.SendtoGrave(e:GetHandler(),REASON_RULE) end)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(10060000,11))
	e2:SetType(EFFECT_TYPE_QUICK_O)
	e2:SetCode(EVENT_FREE_CHAIN)
	e2:SetRange(LOCATION_HAND)
	e2:SetCondition(Cookie2.Trapcon)
	e2:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
		if chk==0 then return not Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,attr,colorCount,mixCount) end
		Duel.SetChainLimit(aux.FALSE) end)
	c:RegisterEffect(e2)
	Cookie2.GravePosition(c)
	Cookie2.SupportPosition(c)
	Cookie2.HandPosition(c)
	Cookie2.BrakePosition(c)
end
function Cookie2.Trapcon(e)
	local tp=e:GetHandlerPlayer()
	return Duel.GetTurnPlayer()==1-tp and Cookie2.BattlePositioncon(e)
end

--S스테이지
function Cookie6.StageEffect(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060000,9))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(Cookie2.Itemcon)
	e1:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
		if chk==0 then return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,attr,colorCount,mixCount) end
		Duel.SetChainLimit(aux.FALSE) end)
	e1:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
		Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
		Duel.MoveToField(e:GetHandler(),tp,tp,LOCATION_FZONE,POS_FACEUP,true) end)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(10060000,12))
	e2:SetType(EFFECT_TYPE_QUICK_O)
	e2:SetCode(EVENT_FREE_CHAIN)
	e2:SetRange(LOCATION_HAND)
	e2:SetCondition(Cookie2.Itemcon)
	e2:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
		if chk==0 then return not Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,attr,colorCount,mixCount) end
		Duel.SetChainLimit(aux.FALSE) end)
	c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(10060002,1))
	e3:SetType(EFFECT_TYPE_QUICK_O)
	e3:SetCode(EVENT_FREE_CHAIN)
	e3:SetRange(LOCATION_FZONE)
	e3:SetHintTiming(TIMING_BATTLE_PHASE,TIMING_BATTLE_PHASE)
	e3:SetCondition(Cookie2.BattlePositioncon)
	e3:SetTarget(Cookie3.notg)
	e3:SetOperation(Cookie2.FzonePositionop)
	c:RegisterEffect(e3)
	Cookie2.GravePosition(c)
	Cookie2.SupportPosition(c)
	Cookie2.HandPosition(c)
	Cookie2.BrakePosition(c)
end
function Cookie2.FzonePositionop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.DisableShuffleCheck()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,0))
	local opts = {
		aux.Stringid(10061002,12),
		aux.Stringid(10061002,1),
		aux.Stringid(10061002,5),
		aux.Stringid(10061002,6),
		aux.Stringid(10061002,7),
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
		Duel.Overlay(ally,c) end end
end