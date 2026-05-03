if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_FIRE,3,3)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)>=1
	and Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,nil,tp)>=1
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally:IsSetCard(0xa15) then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local mg=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	local tc=g:GetFirst()
	if tc:GetOverlayCount()==0 then return end
	local og=tc:GetOverlayGroup()
	local top=og:GetFirst()
	for oc in aux.Next(og) do
		if oc:GetSequence()>top:GetSequence() then top=oc end
	end
	Duel.DisableShuffleCheck()
	Duel.SendtoDeck(top,nil,SEQ_DECKTOP,REASON_RULE)
	Cookie7.faceuphpaddop(e,tp,eg,ep,ev,re,r,rp,1-tp,mg,1)
end