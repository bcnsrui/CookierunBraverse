local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_FIRE,1,2)
end
function s.hpcookiefilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsAttribute(ATTRIBUTE_FIRE) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.hpcookiefilter,tp,LOCATION_MZONE,0,nil,tp)>=1
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.hpcookiefilter,tp,LOCATION_MZONE,0,0,1,nil,tp):GetFirst()
	local hp=math.min(g:GetOverlayCount(),3)
	local options={}
	for i=0,hp do table.insert(options,i) end
	local count=Duel.AnnounceNumber(tp,table.unpack(options))
	if count==0 then return end
	Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,g,count)
	for i=1,count do
		local sg=Duel.GetFieldGroup(tp,LOCATION_GRAVE,0)
		local last=sg:GetFirst()
		for tc in aux.Next(sg) do
			if tc:GetSequence()>last:GetSequence() then last=tc end
		end
		Duel.SendtoHand(last,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,last)
	end
	Duel.ShuffleHand(tp)
end