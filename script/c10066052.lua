if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WIND,2,2)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)>=2
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	local mana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=mana:Select(tp,2,2,nil)
	if #g>0 then Duel.SendtoHand(g,nil,REASON_COST)
	Duel.ConfirmCards(1-tp,g) end
end
function s.oplv1filter(c,tp)
	return c:IsLevel(1) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.oplv1filter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie3.Cookiedestroyop(e,tp,eg,ep,ev,re,r,rp,g) end
end