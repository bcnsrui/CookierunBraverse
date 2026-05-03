if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_FIRE,1,1)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local count=Duel.AnnounceNumber(tp,1,0)
	if count>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count) end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	local count=Duel.AnnounceNumber(tp,2,1,0)
	if #g>0 and count>0 then Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,g,count) end
end