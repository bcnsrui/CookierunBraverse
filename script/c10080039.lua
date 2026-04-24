if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,4,4)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WATER,1,1)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local hg=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
	Duel.SendtoGrave(hg,REASON_RULE)
end