if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,3,3)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_DARK,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.grpurple(c)
	return c:IsAttribute(ATTRIBUTE_DARK) and not c:IsSetCard(0xb00)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.GetMatchingGroupCount(s.grpurple,tp,LOCATION_GRAVE,0,nil)>=5
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.grpurple,tp,LOCATION_GRAVE,0,5,5,nil)
	if #g<5 then return end
	Duel.SendtoDeck(g,nil,SEQ_DECKSHUFFLE,REASON_EFFECT)
	Duel.ShuffleDeck(tp)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil,tp)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local dg=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #dg>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,dg,1) end
end