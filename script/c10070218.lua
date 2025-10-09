local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_LIGHT,1,1)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	local tc=ag:GetFirst()
	local og=tc:GetOverlayGroup()
	local hpnumber=#og
	Duel.DisableShuffleCheck()
	local check=0
	while check<hpnumber do
	last=og:GetFirst()
	tc2=og:GetNext()
	for tc2 in aux.Next(og) do
	if tc2:GetSequence()>last:GetSequence() then last=tc2 end end
	Duel.SendtoDeck(last,nil,SEQ_DECKTOP,REASON_RULE)
	check=check+1 end
	local checkhp=Duel.GetDecktopGroup(tp,hpnumber)
	if #checkhp>0 then
	Duel.Hint(HINT_MESSAGE,tp,aux.Stringid(id,0))
	Duel.ConfirmCards(tp,checkhp) end
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,tc,hpnumber)
end