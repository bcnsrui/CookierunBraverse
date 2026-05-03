if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WATER,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.DisableShuffleCheck()
	local g=Duel.GetDecktopGroup(tp,1)
	if #g==0 then return end
	Duel.ConfirmCards(1-tp,g)
	local tc=g:GetFirst()
	if tc and tc:IsAttribute(ATTRIBUTE_WATER) and tc:GetLevel()==2 then
		local og=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)
		Cookie7.Alldamageeff(e,tp,eg,ep,ev,re,r,rp,og,1)
	end
end
function s.lowhp_blue(c,tp)
	return c:IsAttribute(ATTRIBUTE_WATER) and c:IsLevel(1) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.lowhp_blue,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.lowhp_blue,tp,LOCATION_MZONE,0,1,1,nil,tp)
	if #g>0 then Duel.SendtoDeck(g,nil,SEQ_DECKBOTTOM,REASON_COST) end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),1)
end