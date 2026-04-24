if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

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
function s.otheryellow(c,exc,tp)
	return c~=exc and c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.cookiefilter(c,e,tp)
	return s.otheryellow(c,e:GetHandler(),tp) and c:GetOverlayCount()>=1
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.cookiefilter,tp,LOCATION_MZONE,0,1,nil,e,tp)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.DisableShuffleCheck()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local tg=Duel.SelectMatchingCard(tp,s.cookiefilter,tp,LOCATION_MZONE,0,1,1,nil,e,tp):GetFirst()
	if not tg then return end
	local g=tg:GetOverlayGroup()
	local last=g:GetFirst()
	for tc in aux.Next(g) do
		if tc:GetSequence()>last:GetSequence() then last=tc end
	end
	Duel.SendtoDeck(last,nil,SEQ_DECKTOP,REASON_EFFECT)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local hg=Duel.SelectMatchingCard(tp,Card.IsAbleToDeck,tp,LOCATION_HAND,0,1,1,nil)
	if #hg>0 then
		Duel.SendtoDeck(hg,nil,SEQ_DECKTOP,REASON_EFFECT)
		Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,tg,1)
	end
end