local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_DARK,1,1,0,0)
end
function s.arenacookiefilter(c)
	return c:IsRace(RACE_WARRIOR) and c:IsSetCard(0xc01) and not c:IsSetCard(0xb00)
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(s.arenacookiefilter,tp,LOCATION_GRAVE,0,nil)
	local arenacookies=g:FilterSelect(tp,aux.TRUE,0,2,nil)
	if #arenacookies>0 then
		Duel.SendtoDeck(arenacookies,nil,SEQ_DECKBOTTOM,REASON_EFFECT)
		if #arenacookies>1 then Duel.SortDeckbottom(tp,tp,#arenacookies) end
	end
end
