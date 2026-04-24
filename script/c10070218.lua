if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_LIGHT,1,1)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	local tc=ag:GetFirst()
	if not tc then return end
	local og=tc:GetOverlayGroup()
	if #og>0 then
		Duel.Hint(HINT_MESSAGE,tp,aux.Stringid(id,0))
		Duel.ConfirmCards(tp,og)
	end
end