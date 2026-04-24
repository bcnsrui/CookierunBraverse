if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,2,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_FIRE,1,1)
end
function s.firefilter(c,tp)
	return c:IsCode(10070602,10064005) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.firefilter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.firefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #g>0 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,g,1) end
end