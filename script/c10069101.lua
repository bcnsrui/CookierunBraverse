if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,2,2)
	Cookie6.IGCoookieEffect(c,0,ATTRIBUTE_DARK,1,1)
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler())
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.DisableShuffleCheck()
	local g=Duel.GetDecktopGroup(tp,3)
	if #g==0 then return end
	Duel.ConfirmCards(tp,g)
	local pg=g:Filter(Card.IsAttribute,nil,ATTRIBUTE_DARK)
	local tc
	if #pg>0 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		tc=pg:Select(tp,0,1,nil):GetFirst()
	end
	if tc then
		Duel.SendtoHand(tc,nil,REASON_EFFECT)
		g:RemoveCard(tc)
	end
	if #g>0 then Duel.SendtoGrave(g,REASON_EFFECT) end
end