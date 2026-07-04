if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_DARK,1,1)
end
function s.moonancientfilter(c,tp)
	return (c:IsCode(table.unpack(CARD_MOONLIGHT_COOKIE)) or c:IsSetCard(0xc04))
		and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,-1) end
	if Duel.IsExistingMatchingCard(s.moonancientfilter,tp,LOCATION_MZONE,0,1,nil,tp) then
		Duel.Hint(HINT_SELECTMSG,1-tp,aux.Stringid(10060000,6))
		local hg=Duel.SelectMatchingCard(1-tp,nil,1-tp,LOCATION_HAND,0,1,1,nil)
		if #hg>0 then Duel.SendtoGrave(hg,REASON_EFFECT) end
	end
end