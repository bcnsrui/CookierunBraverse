if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_FIRE,1,1,1,1)
end
function s.hollyfilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp) and c:IsCode(table.unpack(CARD_HOLLYBERRY))
end
function s.Stagecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,0,ALL_COLOR,1,1)
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,1,1)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.hollyfilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #g>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,1) end
end