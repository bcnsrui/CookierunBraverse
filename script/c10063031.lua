if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,2)
	Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd014)
	c:RegisterEffect(e1)
end
function s.otherfilter(c,exc,tp)
	return Cookie3.NoEmFzonefilter(c,tp) and c~=exc and c:GetOverlayCount()>0
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if Duel.IsExistingMatchingCard(s.otherfilter,tp,LOCATION_MZONE,0,1,nil,c,tp) then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local tc=Duel.SelectMatchingCard(tp,function(sc) return s.otherfilter(sc,c,tp) end,tp,LOCATION_MZONE,0,1,1,nil):GetFirst()
	if not tc then return end
	local g=tc:GetOverlayGroup()
	local last=g:GetFirst()
	for oc in aux.Next(g) do
		if oc:GetSequence()>last:GetSequence() then last=oc end
	end
	Duel.DisableShuffleCheck()
	Duel.SendtoDeck(last,nil,SEQ_DECKTOP,REASON_EFFECT)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,c,1) end
end