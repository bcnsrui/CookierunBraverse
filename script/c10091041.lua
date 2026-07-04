if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WIND,0,0)
end
function s.greensupportfilter(c)
	return c:IsAttribute(ATTRIBUTE_WIND)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	local allymana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	return allymana:FilterCount(s.greensupportfilter,nil)>=1
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	local allymana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=allymana:FilterSelect(tp,s.greensupportfilter,1,1,nil)
	if #g>0 then
		Duel.SendtoHand(g,nil,REASON_COST)
		Duel.ConfirmCards(1-tp,g)
		Duel.ShuffleHand(tp)
	end
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,nil,tp)
	if #g>0 then Cookie7.Allhpaddop(e,tp,eg,ep,ev,re,r,rp,g,1) end
end