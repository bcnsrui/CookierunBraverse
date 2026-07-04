if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_WATER,1,1)
end
function s.seafairyancientfilter(c,tp)
	return (c:IsCode(table.unpack(CARD_SEA_FAIRY_COOKIE)) or c:IsSetCard(0xc04))
		and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,-1) end
	if Duel.IsExistingMatchingCard(s.seafairyancientfilter,tp,LOCATION_MZONE,0,1,nil,tp) then
		local count=Duel.AnnounceNumber(tp,1,0)
		if count>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count) end
	end
end