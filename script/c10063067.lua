local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,3,3)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,2)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	local supportarea=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	if #supportarea<=6 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local restmana=ally:GetOverlayGroup()
		if #restmana>0 then
		local tc=restmana:Select(tp,0,1,nil)
		if #tc>0 then Duel.Remove(tc,POS_FACEUP,REASON_EFFECT) end
	end end
end