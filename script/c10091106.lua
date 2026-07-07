if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_EARTH,0,0)
end
function s.lv5orc08filter(c,tp)
	return c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
	and (c:IsLevelAbove(5) or c:IsSetCard(0xc08))
end
function s.Trapcost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ATTRIBUTE_EARTH,1,1)
	or Duel.IsExistingMatchingCard(s.lv5orc08filter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.Trapcostoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.IsExistingMatchingCard(s.lv5orc08filter,tp,LOCATION_MZONE,0,1,nil,tp) then return end
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_EARTH,1,1)
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,-1) end
end