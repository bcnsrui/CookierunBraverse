if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,2,2)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_FIRE,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.othercookiefilter(c,tp,hd)
	return c~=hd and c:IsRace(RACE_WARRIOR) and c:GetOverlayCount()>=2 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	return Duel.IsExistingMatchingCard(s.othercookiefilter,tp,LOCATION_MZONE,0,1,c,tp,c)
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.othercookiefilter,tp,LOCATION_MZONE,0,1,1,c,tp,c)
	if #g>0 then Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,g,2) end
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)>=1
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally:IsSetCard(0xa15) then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g==0 then return end
	local tc=g:GetFirst()
	if tc:GetOverlayCount()==0 then return end
	local og=tc:GetOverlayGroup()
	local top=og:GetFirst()
	for oc in aux.Next(og) do
		if oc:GetSequence()>top:GetSequence() then top=oc end
	end
	Duel.DisableShuffleCheck()
	Duel.SendtoDeck(top,nil,SEQ_DECKTOP,REASON_RULE)
	Cookie7.faceuphpaddop(e,tp,eg,ep,ev,re,r,rp,1-tp,e:GetHandler(),1)
end