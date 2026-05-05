--쿠키런 브레이버스의 공통적인 임플란트
Cookie3={}

ALL_COLOR=ATTRIBUTE_FIRE+ATTRIBUTE_WATER+ATTRIBUTE_EARTH+ATTRIBUTE_WIND+ATTRIBUTE_LIGHT+ATTRIBUTE_DARK

--체인불가
function Cookie3.notg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetChainLimit(aux.FALSE)
end

--코스트 추가
function Cookie3.hasColorCount(attr,count)
	return function(sg,e,tp,mg)
		return sg:FilterCount(Card.IsAttribute,nil,attr)>=count
	end
end

--레스트 코스트
function Cookie3.restcon(e,tp,eg,ep,ev,re,r,rp,chk)
	return e:GetHandler():IsAttackPos()
end
--마나 코스트
function Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,attr,colorCount,mixCount)
	local c=e:GetHandler()
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally:IsCode(10060000) then return true end
	local g=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_REMOVED,0,nil)
	if mixCount==0 then return true end
	if chk==0 then return #g>=mixCount and
	aux.SelectUnselectGroup(g,e,tp,mixCount,mixCount,Cookie3.hasColorCount(attr,colorCount),0) end
end
function Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
	local c=e:GetHandler()
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally:IsCode(10060000) then return end
	local g=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_REMOVED,0,nil)
	if mixCount==0 then return true end
	local tg=aux.SelectUnselectGroup(g,e,tp,mixCount,mixCount,Cookie3.hasColorCount(attr,colorCount),1,tp,aux.Stringid(10060000,6))
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	Duel.Overlay(ally,tg)
end
--핸드 코스트
function Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,chk,attr,handcost1,handcost2)
	return Duel.GetMatchingGroupCount(Card.IsAttribute,tp,LOCATION_HAND,0,e:GetHandler(),attr)>=handcost1
end
function Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,attr,handcost1,handcost2)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local hg=Duel.SelectMatchingCard(tp,Card.IsAttribute,tp,LOCATION_HAND,0,handcost1,handcost2,e:GetHandler(),attr)
	Duel.SendtoGrave(hg,REASON_RULE)
end

--배틀 페이즈 기동
function Cookie3.Battleskillcon(e)
	local tp=e:GetHandlerPlayer()
	return Duel.GetTurnPlayer()==tp and Duel.GetCurrentPhase()==PHASE_BATTLE_STEP
	and not (Duel.GetAttacker() and Duel.GetAttacker():IsControler(tp)) and Duel.GetCurrentChain()==0
end

--메인 쿠키 제외
function Cookie3.NoEmFzonefilter(c,tp)
	return not (c:IsLocation(LOCATION_EMZONE+LOCATION_FZONE) or (c:IsControler(1-tp) and c:IsSetCard(0xa05)))
end

--서포트 에리어 지정
function Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,allymanazone1,allymanazone2,enemymanazone1,enemymanazone2)
	if allymanazone1==1 then allymanazone1=LOCATION_REMOVED end
	if enemymanazone1==1 then enemymanazone1=LOCATION_REMOVED end
	if allymanazone2==1 then allymanazone2=LOCATION_EMZONE end
	if enemymanazone2==1 then enemymanazone2=LOCATION_EMZONE end
	local activemana=Duel.GetFieldGroup(tp,allymanazone1,enemymanazone1,nil)
	local allycookie=Duel.GetMatchingGroup(Card.IsFaceup,tp,allymanazone2,enemymanazone2,nil):GetFirst()
	if allycookie then
	local restmana=allycookie:GetOverlayGroup()
	activemana:Merge(restmana) end
	return activemana
end

function Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,allymanazone1,allymanazone2,enemymanazone1,enemymanazone2)
	if allymanazone1==1 then allymanazone1=LOCATION_REMOVED end
	if enemymanazone1==1 then enemymanazone1=LOCATION_REMOVED end
	if allymanazone2==1 then allymanazone2=LOCATION_EMZONE end
	if enemymanazone2==1 then enemymanazone2=LOCATION_EMZONE end
	local activemana=Duel.GetFieldGroup(tp,allymanazone1,enemymanazone1,nil)
	local allycookie=Duel.GetMatchingGroup(Card.IsFaceup,tp,allymanazone2,enemymanazone2,nil):GetFirst()
	if allycookie then
	local restmana=allycookie:GetOverlayGroup()
	activemana:Merge(restmana) end
	return #activemana
end

--리프레시
function Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)~=0 then return end
	local brk=1
	if Duel.IsExistingMatchingCard(Card.IsCode,tp,LOCATION_MZONE,0,1,nil,10069096) then	brk=0
	elseif Duel.IsExistingMatchingCard(Card.IsCode,tp,0,LOCATION_MZONE,1,nil,10069111) then brk=2
	else brk=1 end
	local ag=Duel.SelectMatchingCard(tp,Card.IsRace,tp,LOCATION_GRAVE,0,brk,brk,nil,RACE_WARRIOR)
	if #ag>0 then Duel.SendtoExtraP(ag,nil,REASON_EFFECT) end
	local refill=Duel.GetFieldGroup(tp,LOCATION_GRAVE,0)
	local function refresh_deck_tier(c)
		if c:IsRace(RACE_WARRIOR) then
			if c:IsSetCard(0xb00) then return 1 end
			return 2
		end
		if c:IsRace(RACE_SPELLCASTER) then return 3 end
		if c:IsRace(RACE_FAIRY) then return 4 end
		if c:IsRace(RACE_FIEND) then return 5 end
		return 6
	end
	local sorted={}
	for tc in aux.Next(refill) do sorted[#sorted+1]=tc end
	table.sort(sorted,function(a,b)
		local ta,tb=refresh_deck_tier(a),refresh_deck_tier(b)
		if ta~=tb then return ta>tb end
		return a:GetCode()<b:GetCode()
	end)
	Duel.DisableShuffleCheck()
	for _,tc in ipairs(sorted) do
		Duel.SendtoDeck(tc,nil,SEQ_DECKTOP,REASON_RULE)
	end
	Duel.ConfirmCards(1-tp,refill)
	Duel.ShuffleDeck(tp)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally and not ally:IsSetCard(0xa17) then
	local e1=Effect.CreateEffect(ally)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xa17)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD)
	ally:RegisterEffect(e1) end
end

--상대 배틀에리어 쿠키 트래시로 보내기
function Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,g)
	if type(g)=="Card" then	local sg=Group.CreateGroup() sg:AddCard(g) g=sg	end
	if Duel.IsExistingMatchingCard(Card.IsSetCard,tp,0,LOCATION_MZONE,1,nil,0xd10) then return end
	local stage=Duel.GetMatchingGroup(Card.IsCode,tp,LOCATION_FZONE,0,nil,10070522)
	Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
	Duel.SendtoGrave(g,REASON_EFFECT)
	for tc in aux.Next(g) do
	if tc:IsSetCard(0xd09) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,tc) end
	if #stage>0 and stage:GetFirst():GetCounter(0x1000)==0 and tc:IsControler(1-tp) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,stage) end end
end

--쿠키런 드로우
function Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,draw)
	if draw==0 then return end
	local refill=Duel.GetMatchingGroup(nil,tp,LOCATION_GRAVE,0,nil)
	local deckcount=Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)
	if deckcount<=draw then
	Duel.Draw(tp,deckcount,REASON_EFFECT)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Draw(tp,draw-deckcount,REASON_EFFECT)
	else Duel.Draw(tp,draw,REASON_EFFECT) end
end

--쿠키런 트래시
function Cookie3.CookieTrashop(e,tp,eg,ep,ev,re,r,rp,trash)
	if trash==0 then return end
	local refill=Duel.GetMatchingGroup(nil,tp,LOCATION_GRAVE,0,nil)
	local deckcount=Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)
	local deck=Duel.GetFieldGroup(tp,LOCATION_DECK,0)
	if deckcount<=trash then
	Duel.DiscardDeck(tp,deckcount,REASON_EFFECT)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
	Duel.DiscardDeck(tp,trash-deckcount,REASON_EFFECT)
	else Duel.DiscardDeck(tp,trash,REASON_EFFECT) end
end

--쿠키런 등장시
function Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,ag)
	local function sourceok(c)
	-- 0xe011: 트래시에서 등장했을 때
	if c:IsSetCard(0xe011) and not c:IsLocation(LOCATION_GRAVE) then return false end
	-- 0xe012: 서포트에리어에서 등장했을 때 (액티브/레스트)
	if c:IsSetCard(0xe012) and not (c:IsLocation(LOCATION_REMOVED) or c:IsLocation(LOCATION_OVERLAY)) then return false end
	-- 0xe013: 브레이크에리어에서 등장했을 때
	if c:IsSetCard(0xe013) and not c:IsLocation(LOCATION_EXTRA) then return false end
	return true end

	local typ=type(ag)
	if typ=="Card" and ag==nil then return
	elseif typ=="Group" and #ag==0 then return end

	local tg=Group.CreateGroup()
	if typ=="Card" then tg:AddCard(ag)
	elseif typ=="Group" then tg:Merge(ag) else return end

	local c=e:GetHandler()
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	for tc in aux.Next(tg) do
	if ally and tc:IsLocation(LOCATION_GRAVE) then
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xa08)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
	ally:RegisterEffect(e1) end	end
	for tc in aux.Next(tg) do
	if ally and tc:IsLocation(LOCATION_EXTRA) then
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xa13)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
	ally:RegisterEffect(e1)	end
	if tc:IsLocation(LOCATION_EXTRA) and tc:IsCode(table.unpack(CARD_GOLD_CHEESE)) then
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xa131)
	e1:SetReset(RESET_PHASE+PHASE_END)
	tc:RegisterEffect(e1) end
	if tc:IsLocation(LOCATION_EXTRA) and tc:IsLevel(3) then
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xa132)
	e1:SetReset(RESET_PHASE+PHASE_END)
	tc:RegisterEffect(e1) end
	if tc:IsLocation(LOCATION_GRAVE) and tc:IsCode(table.unpack(CARD_DARK_CACAO)) then
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xa133)
	e1:SetReset(RESET_PHASE+PHASE_END)
	tc:RegisterEffect(e1) end end

	local validg=Group.CreateGroup()
	for tc in aux.Next(tg) do
	local areacheck=sourceok(tc) and 0 or 1
	if tc:IsLocation(LOCATION_EXTRA) then Duel.SendtoGrave(tc,REASON_RULE) end
	Duel.SpecialSummon(tc,0,tp,tp,false,false,POS_FACEUP_ATTACK)
	if areacheck==0 then validg:AddCard(tc) end end
	local ag2=validg:Filter(function(c) return (c:IsSetCard(0xd011) or c:IsSetCard(0xd014)) end,nil)
	Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,ag2)
	if Duel.GetTurnPlayer()==tp then
	local ag3=validg:Filter(function(c) return (c:IsSetCard(0xd012) or c:IsSetCard(0xd015)) end,nil)
	Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,ag3) end
	if Duel.GetTurnPlayer()~=tp then
	local ag4=validg:Filter(function(c) return (c:IsSetCard(0xd013) or c:IsSetCard(0xd016)) end,nil)
	Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,ag4) end
end

--쿠키런 기절시
function Cookie3.Cookiedestroyop(e,tp,eg,ep,ev,re,r,rp,ag)
	local typ=type(ag)
	if typ=="Card" and ag==nil then return
	elseif typ=="Group" and #ag==0 then return end
	local tg
	if typ=="Card" then tg=ag
	elseif typ=="Group" then tg=ag:GetFirst() end
	Duel.Destroy(tg,REASON_EFFECT)
	local tcp=tg:GetControler()
	if tg:IsSetCard(0xd021) or tg:IsSetCard(0xd024) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,tg)
	elseif (tg:IsSetCard(0xd022) or tg:IsSetCard(0xd025)) and Duel.GetTurnPlayer()==tcp then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,tg)
	elseif (tg:IsSetCard(0xd023) or tg:IsSetCard(0xd026)) and Duel.GetTurnPlayer()~=tcp then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,tg) end
end