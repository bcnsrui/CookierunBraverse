--쿠키런 브레이버스의 공통적인 임플란트
Cookie3={}

--효과트리거
function Cookie3.eventtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetChainLimit(Cookie3.effectchainlm2)
end
function Cookie3.effectchainlm2(e,rp,tp)
	return e:GetHandler():IsSetCard(0xa05)
end
function Cookie3.eventtg2(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetChainLimit(Cookie3.effectchainlm)
end
function Cookie3.effectchainlm(e,rp,tp)
	return e:GetHandler():IsSetCard(0xc02)
end

--코스트 추가
function Cookie3.hasColorCount(attr,count)
	return function(sg,e,tp,mg)
		return sg:FilterCount(Card.IsAttribute,nil,attr)>=count
	end
end

--레스트 코스트
function Cookie3.restcon(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return e:GetHandler():IsAttackPos() end
end
function Cookie3.restcostcon(e,tp,eg,ep,ev,re,r,rp)
	if e:GetHandler():IsAttackPos()
	then return true end
	return false
end
function Cookie3.restcost(e,tp,eg,ep,ev,re,r,rp)
	Duel.ChangePosition(e:GetHandler(),POS_FACEUP_DEFENSE)
end

--마나 코스트
function Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,attr,colorCount,mixCount)
	local c=e:GetHandler()
	local g=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_REMOVED,0,nil)
	if chk==0 then return #g>=mixCount and
	aux.SelectUnselectGroup(g,e,tp,mixCount,mixCount,Cookie3.hasColorCount(attr,colorCount),0) end
end
function Cookie3.manacostcon(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
	local c=e:GetHandler()
	local g=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_REMOVED,0,nil)
	if #g>=mixCount and	aux.SelectUnselectGroup(g,e,tp,mixCount,mixCount,Cookie3.hasColorCount(attr,colorCount),0)
	then return true end
	return false
end
function Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
	local c=e:GetHandler()
	local g=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_REMOVED,0,nil)
	local tg=aux.SelectUnselectGroup(g,e,tp,mixCount,mixCount,Cookie3.hasColorCount(attr,colorCount),1,tp,aux.Stringid(10060000,6))
	Duel.SendtoGrave(tg,REASON_RULE|REASON_RETURN)
	Duel.Remove(tg,POS_FACEDOWN,REASON_RULE)
end

--핸드 코스트
function Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,chk,handcost1,handcost2)
	if chk==0 then return Duel.GetMatchingGroupCount(nil,tp,LOCATION_HAND,0,e:GetHandler())>=handcost1 end
end
function Cookie3.handcostcon(e,tp,eg,ep,ev,re,r,rp,handcost1,handcost2)
	if Duel.GetMatchingGroupCount(nil,tp,LOCATION_HAND,0,e:GetHandler())>=handcost1
	then return true end
	return false
end
function Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,handcost1,handcost2)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local hg=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,handcost1,handcost2,nil)
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
	if Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)==0 then
	local ag=Duel.SelectMatchingCard(tp,Card.IsRace,tp,LOCATION_GRAVE,0,1,1,nil,RACE_WARRIOR)
	Duel.SendtoExtraP(ag,nil,REASON_EFFECT)
	local refill=Duel.GetFieldGroup(tp,LOCATION_GRAVE,0)
	Duel.SendtoDeck(refill,nil,SEQ_DECKSHUFFLE,REASON_RULE)
	Duel.ShuffleDeck(tp) end
end

--타겟X
function Cookie3.notg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetChainLimit(aux.FALSE)
end

--상대 배틀에리어 쿠키 트래시로 보내기
function Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,g)
	Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
	Duel.SendtoGrave(g,REASON_EFFECT)
	if #g==0 then return end
	if Duel.IsExistingMatchingCard(Card.IsCode,tp,LOCATION_FZONE,0,1,nil,10070522) then
	local filtersg=Duel.GetMatchingGroup(Card.IsCode,tp,LOCATION_FZONE,0,nil,10070522)
	Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,filtersg) end
end