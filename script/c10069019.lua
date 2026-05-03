if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_FIRE,2,2)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,nil,tp)>=1
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #g==0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,1)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,g,1) end
end