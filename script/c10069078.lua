if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,1,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WATER,0,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd031)
	c:RegisterEffect(e1)
end
function s.ancient_ally(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsSetCard(0xc04) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.ancient_ally,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.lv1opp(c,tp)
	return c:IsLevel(1) and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.lv1opp,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Duel.SendtoDeck(g,nil,SEQ_DECKBOTTOM,REASON_EFFECT) end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)\
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=5 then
	local draw=Duel.AnnounceNumber(tp,2,1,0)
	if draw>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,draw) end end
end