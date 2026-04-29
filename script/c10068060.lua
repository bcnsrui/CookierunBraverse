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
	local greens=allymana:Filter(s.greensupportfilter,nil)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local sg=greens:Select(tp,1,1,nil)
	Duel.SendtoHand(sg,nil,REASON_COST)
	Duel.ConfirmCards(1-tp,sg)
	Duel.ShuffleHand(tp)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local sel=Duel.SelectOption(tp,aux.Stringid(id,0),aux.Stringid(id,1))
	if sel==0 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
		if #ag>0 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,ag,1) end
	else
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
		if #ag>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,ag,1) end
	end
end