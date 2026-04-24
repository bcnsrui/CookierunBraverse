local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,3,3)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_WATER,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.deckbottomfilter(c,tp)
	return c:IsLevel(1) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,chk,ALL_COLOR,1,1)
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,1,1)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local b1=Duel.IsExistingMatchingCard(s.deckbottomfilter,tp,0,LOCATION_MZONE,1,nil,tp)
	if b1 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,6))
		local op=Duel.SelectOption(tp,aux.Stringid(id,1),aux.Stringid(id,2))
		if op==0 then
			Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
			local g=Duel.SelectMatchingCard(tp,s.deckbottomfilter,tp,0,LOCATION_MZONE,1,1,nil,tp)
			if #g>0 then Duel.SendtoDeck(g,nil,SEQ_DECKBOTTOM,REASON_EFFECT) end
		else
			local count=Duel.AnnounceNumber(tp,2,1,0)
			if count==0 then return end
			Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count)
		end
	else
		local count=Duel.AnnounceNumber(tp,2,1,0)
		if count==0 then return end
		Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count)
	end
end