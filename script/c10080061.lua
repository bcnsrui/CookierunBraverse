if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
end
function s.gravefilter(c)
	return not c:IsRace(RACE_WARRIOR)
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.gravefilter,tp,LOCATION_GRAVE,0,nil)>=2
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.gravefilter,tp,LOCATION_GRAVE,0,2,2,nil)
	if #g>0 then
		Duel.SendtoDeck(g,nil,SEQ_DECKSHUFFLE,REASON_COST)
		Duel.ShuffleDeck(tp)
	end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler())
end