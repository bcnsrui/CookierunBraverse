if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_EARTH,1,1)
end
function s.lv5orc08filter(c,tp)
	return c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
	and (c:IsLevelAbove(5) or c:IsSetCard(0xc08))
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,1,nil,tp)
	if #g==0 then return end
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,-1)
	if Duel.IsExistingMatchingCard(s.lv5orc08filter,tp,LOCATION_MZONE,0,1,nil,tp) then
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,-1) end
end