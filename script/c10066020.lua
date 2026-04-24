if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_FIRE,2,2)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)>=1
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.DisableShuffleCheck()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,ag,-2)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local hc=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #hc>0 then
	Cookie7.hpdecktop(e,tp,eg,ep,ev,re,r,rp,hc,1)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end
end