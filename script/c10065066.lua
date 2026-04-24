local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WIND,1,1,0,0)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_WIND,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd133)
	c:RegisterEffect(e1)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,0,ALL_COLOR,1,1)
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,1,1)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local mana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,1,0,0)
	if #mana>0 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local tc=mana:Select(tp,0,1,nil)
		Duel.Remove(tc,POS_FACEUP,REASON_EFFECT) end
	if Duel.IsExistingMatchingCard(Card.ListsCode,tp,LOCATION_MZONE,0,1,nil,CARD_LONGAN_DRAGON)
	and Duel.SelectYesNo(tp,aux.Stringid(10060001,8)) then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end
end