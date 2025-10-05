local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.SSCookieEffect(c,ATTRIBUTE_DARK,2,2)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return not c:IsSetCard(0xb00)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(s.filter,tp,LOCATION_GRAVE,0,nil)
	if #g>0 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local tg=g:Select(tp,1,3,nil)
		if #tg>0 then
			Duel.SendtoDeck(tg,nil,0,REASON_EFFECT)
			Duel.ShuffleDeck(tp)
		end
	end
end