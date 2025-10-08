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
	local g=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_REMOVED,0,nil)
	if chk==0 then return #g>=mixCount and
	aux.SelectUnselectGroup(g,e,tp,mixCount,mixCount,Cookie3.hasColorCount(attr,colorCount),0) end
end
function Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
	local c=e:GetHandler()
	local g=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_REMOVED,0,nil)
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
function Cookie3.NoEmFzonefilter(c)
	return not (c:IsLocation(LOCATION_EMZONE+LOCATION_FZONE) or c:GetOverlayCount()==0)
end

--리프레시
function Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)~=0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,9))
	local ag=Duel.SelectMatchingCard(tp,Card.IsRace,tp,LOCATION_GRAVE,0,1,1,nil,RACE_WARRIOR)
	Duel.SendtoExtraP(ag,nil,REASON_EFFECT)
	local refill=Duel.GetFieldGroup(tp,LOCATION_GRAVE,0)
	Duel.SendtoDeck(refill,nil,SEQ_DECKSHUFFLE,REASON_RULE)
	Duel.ShuffleDeck(tp)
end