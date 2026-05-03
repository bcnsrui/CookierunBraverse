if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_LIGHT,2,2)
end
function s.overheal(c,tp)
	return Cookie3.NoEmFzonefilter(c,tp) and c:GetOverlayCount()>c:GetBaseDefense()
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,-2) end
	if Duel.IsExistingMatchingCard(s.overheal,tp,LOCATION_MZONE,LOCATION_MZONE,1,nil,tp) then
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,-1)	end
end