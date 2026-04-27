if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,1,2)
	Cookie6.IGCoookieEffect(c,1,ALL_COLOR,0,0)
end
function s.arenafilter(c)
	return c:IsSetCard(0xc01)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)>=1
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0):Filter(s.arenafilter,nil)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=g:Select(tp,1,1,nil)
	if #sg>0 then Duel.SendtoGrave(sg,REASON_EFFECT) end
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local deckcount=Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)
	local g=Duel.GetDecktopGroup(tp,math.min(3,deckcount))
	Duel.ConfirmCards(tp,g)
	local sg=g:Filter(s.arenafilter,nil)
	if #sg>0 and Duel.SelectYesNo(tp,aux.Stringid(id,0)) then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local tc=sg:Select(tp,1,1,nil)
		local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
		if ally and #tc>0 then Duel.Overlay(ally,tc) end
		g:RemoveCard(tc:GetFirst())
	end
	if #g>0 then Duel.SendtoGrave(g,REASON_EFFECT) end
end