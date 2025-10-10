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
	if mixCount==0 then return true end
	if chk==0 then return #g>=mixCount and
	aux.SelectUnselectGroup(g,e,tp,mixCount,mixCount,Cookie3.hasColorCount(attr,colorCount),0) end
end
function Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
	local c=e:GetHandler()
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
	local restmana=allycookie:GetOverlayGroup()
	activemana:Merge(restmana)
	return activemana
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

--상대 배틀에리어 쿠키 트래시로 보내기
function Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,g)
	if #g==0 then return end
	Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
	Duel.SendtoGrave(g,REASON_EFFECT)
end

--쿠키런 드로우
function Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,draw)
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
	local refill=Duel.GetMatchingGroup(nil,tp,LOCATION_GRAVE,0,nil)
	local deckcount=Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)
	local deck=Duel.GetFieldGroup(tp,LOCATION_DECK,0)
	if deckcount<=trash then
	Duel.DiscardDeck(tp,deckcount,REASON_EFFECT)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
	Duel.DiscardDeck(tp,trash-deckcount,REASON_EFFECT)
	else Duel.DiscardDeck(tp,trash,REASON_EFFECT) end
end