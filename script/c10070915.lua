if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WATER,1,1)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=5 then
		local count=Duel.AnnounceNumber(tp,1,0)
		if count==1 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end
	end
	if not Duel.IsExistingMatchingCard(s.seafairyfilter,tp,LOCATION_MZONE,0,1,nil,tp) then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.seafairyfilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #g>0 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,g,1) end
end
function s.seafairyfilter(c,tp)
	return c:IsCode(10062029,10064073,10070906) and c:GetOverlayCount()<=5 and Cookie3.NoEmFzonefilter(c,tp)
end