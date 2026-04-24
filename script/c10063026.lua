local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,1,2)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_LIGHT,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.cookiefilter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.cookiefilter(c,tp)
	return Cookie3.NoEmFzonefilter(c,tp)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local tc=Duel.SelectMatchingCard(tp,s.cookiefilter,tp,LOCATION_MZONE,0,1,1,nil,tp):GetFirst()
	if not tc then return end
	local hpnumber=tc:GetOverlayCount()
	if hpnumber==0 then return end
	Duel.DisableShuffleCheck()
	local check=0
	while check<hpnumber do
		local og=tc:GetOverlayGroup()
		if og:GetCount()==0 then break end
		local last=og:GetFirst()
		for oc in aux.Next(og) do
			if oc:GetSequence()>last:GetSequence() then last=oc end
		end
		Duel.SendtoDeck(last,nil,SEQ_DECKTOP,REASON_RULE)
		check=check+1
	end
	local checkhp=Duel.GetDecktopGroup(tp,hpnumber)
	if #checkhp>0 then
		Duel.Hint(HINT_MESSAGE,tp,aux.Stringid(id,0))
		Duel.ConfirmCards(tp,checkhp)
		if hpnumber>1 then Duel.SortDecktop(tp,tp,hpnumber) end
	end
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,tc,hpnumber)
end
