if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_WIND,2,2)
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,-2)
	if Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)<5 then return end
	local mana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,1,0,0)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=mana:Select(tp,0,1,nil)
	if #sg>0 then Duel.Remove(sg,POS_FACEUP,REASON_EFFECT) end
end