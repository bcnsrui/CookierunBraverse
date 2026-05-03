if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_WATER,1,1)
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.DisableShuffleCheck()
	local g=Duel.GetDecktopGroup(tp,1)
	if #g==0 then return end
	local tc=g:GetFirst()
	Duel.ConfirmCards(1-tp,g)
	if tc:IsRace(RACE_WARRIOR) then
		local og=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)
		Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,og,-1)
	else
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,8)) then
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end end
end