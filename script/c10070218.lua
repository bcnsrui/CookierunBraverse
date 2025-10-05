local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ItemEffect(c)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return
	Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_LIGHT,1,1) end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,1,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,1,1,nil)
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
	Duel.Remove(last,POS_FACEDOWN,REASON_RULE)
	check=check+1 end
	local checkhp=Duel.GetDecktopGroup(tp,hpnumber)
	if #checkhp>0 then
	Duel.Hint(HINT_MESSAGE,tp,aux.Stringid(id,0))
	Duel.ConfirmCards(tp,checkhp) end
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,tc,hpnumber)
end