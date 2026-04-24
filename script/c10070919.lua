if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_WATER,1,1)
end
function s.hp2filter(c,tp)
	return c:GetOverlayCount()>=2 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil,tp)
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g==0 then return end
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,-1)
	if Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,0,ALL_COLOR,2,2)
		and Duel.IsExistingMatchingCard(s.hp2filter,tp,0,LOCATION_MZONE,1,nil,tp)
		and Duel.SelectYesNo(tp,aux.Stringid(10060003,1)) then
		Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,2,2)
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local tg=Duel.SelectMatchingCard(tp,s.hp2filter,tp,0,LOCATION_MZONE,0,1,nil,tp)
		if #tg>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,tg,1) end
	end
end