if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_DARK,2,2)
end
function s.beastopp(c,tp)
	return c:IsSetCard(0xc06) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,-2) end
	if Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ATTRIBUTE_DARK,1,1)
	and Duel.SelectYesNo(tp,aux.Stringid(10060003,1)) then
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_DARK,1,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local bg=Duel.SelectMatchingCard(tp,s.beastopp,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #bg>0 then Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,bg) end end
end