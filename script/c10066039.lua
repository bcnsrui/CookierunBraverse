if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,3,3)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_LIGHT,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local op=Duel.GetMatchingGroup(Card.IsFaceup,1-tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	return op<=6 and Duel.GetMatchingGroup(Card.IsFaceup,1-tp,LOCATION_EXTRA,0,nil):GetCount()>0
end
function s.opbattlefilter(c,tp,lv)
	return c:IsLevel(lv) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local bg=Duel.SelectMatchingCard(tp,Card.IsFaceup,tp,0,LOCATION_EXTRA,1,1,nil)
	local bc=bg:GetFirst()
	if not bc then return end
	local lv=bc:GetLevel()
	Duel.SendtoGrave(bg,REASON_EFFECT)
	if Duel.GetMatchingGroupCount(s.opbattlefilter,tp,0,LOCATION_MZONE,nil,tp,lv+1)==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local mg=Duel.SelectMatchingCard(tp,s.opbattlefilter,tp,0,LOCATION_MZONE,0,1,nil,tp,lv+1)
	if #mg>0 then Duel.SendtoExtraP(mg,nil,REASON_EFFECT) end
end