if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,2,3)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_DARK,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)>=1
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
	local g=Duel.SelectMatchingCard(tp,aux.TRUE,tp,LOCATION_HAND,0,1,1,nil)
	Duel.SendtoGrave(g,REASON_RULE)
end
function s.gyfilter(c)
	return c:IsAttribute(ATTRIBUTE_DARK)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.gyfilter,tp,LOCATION_GRAVE,0,nil)>=1
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.gyfilter,tp,LOCATION_GRAVE,0,0,1,nil)
	if #g>0 then Duel.SendtoHand(g,nil,REASON_EFFECT) 
		Duel.ConfirmCards(1-tp,g)
		Duel.ShuffleHand(tp) end
end