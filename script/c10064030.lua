if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,3)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_LIGHT,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.otheryellow(c,tp)
	return c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.otheryellow,tp,LOCATION_MZONE,0,1,e:GetHandler(),tp)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.DisableShuffleCheck()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local tg=Duel.SelectMatchingCard(tp,s.otheryellow,tp,LOCATION_MZONE,0,0,1,e:GetHandler(),tp)
	Cookie7.hpdecktop(e,tp,eg,ep,ev,re,r,rp,tg,1)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally:IsSetCard(0xa15) then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,0,1,nil)
	if #g>0 then Duel.SendtoDeck(g,nil,SEQ_DECKTOP,REASON_EFFECT)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,tg,1) end
end