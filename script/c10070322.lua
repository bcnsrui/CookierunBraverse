if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WIND,1,1,0,0)
end
function s.Stagecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)>=1
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local support=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=support:Select(tp,1,1,nil)
	Duel.SendtoHand(sg,nil,REASON_EFFECT)
	Duel.ConfirmCards(1-tp,sg)
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,8)) then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end
end