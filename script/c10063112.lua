if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,1,1)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_DARK,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.notcookie(c)
	return not c:IsRace(RACE_WARRIOR)
end
function s.purplecookie(c)
	return c:IsAttribute(ATTRIBUTE_DARK) and c:IsRace(RACE_WARRIOR)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.notcookie,tp,LOCATION_GRAVE,0,2,nil)
		and Duel.IsExistingMatchingCard(s.purplecookie,tp,LOCATION_GRAVE,0,1,nil)
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.notcookie,tp,LOCATION_GRAVE,0,2,2,nil)
	Duel.DisableShuffleCheck()
	Duel.SendtoDeck(g,nil,SEQ_DECKBOTTOM,REASON_COST)
	Duel.SortDeckbottom(tp,tp,2)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.purplecookie,tp,LOCATION_GRAVE,0,0,1,nil)
	if #g>0 then Duel.SendtoHand(g,nil,REASON_EFFECT) end
end