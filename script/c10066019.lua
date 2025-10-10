local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_FIRE,1,1)
end
function s.cookiefilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:GetOverlayCount()>0 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Itemcost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.cookiefilter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.Itemcostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.DisableShuffleCheck()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local tg=Duel.SelectMatchingCard(tp,s.cookiefilter,tp,LOCATION_MZONE,0,1,1,nil,tp):GetFirst()
	local g=tg:GetOverlayGroup()
	local last=g:GetFirst()
	local tc=g:GetNext()
	for tc in aux.Next(g) do
		if tc:GetSequence()>last:GetSequence() then last=tc end
	end
	Duel.SendtoDeck(last,nil,SEQ_DECKTOP,REASON_EFFECT)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local enemy=Duel.GetMatchingGroup(Card.IsFaceup,tp,0,LOCATION_EXTRA,nil)
	return #enemy<=1
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(Card.IsFaceup,tp,0,LOCATION_REMOVED,nil)
	if #g==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=g:Select(tp,0,2,nil)
	if #sg>0 then
		local enemy=Duel.GetMatchingGroup(nil,tp,0,LOCATION_EMZONE,nil):GetFirst()
		Duel.Overlay(enemy,sg) end
end