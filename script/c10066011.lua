if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,2,2)
	Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd024)
	c:RegisterEffect(e1)
end
function s.hpfilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:GetOverlayCount()>0 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.hpfilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #g==0 then return end
	local tc=g:GetFirst()
	local hg=tc:GetOverlayGroup()
	if #hg==0 then return end
	local top=hg:GetFirst()
	for hc in aux.Next(hg) do
		if hc:GetSequence()>top:GetSequence() then top=hc end
	end
	Duel.SendtoDeck(top,nil,SEQ_DECKTOP,REASON_EFFECT)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
end