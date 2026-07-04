if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_FIRE,1,1)
end
function s.hp1lv3filter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsLevel(3) and c:GetOverlayCount()==1 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.hp1lv3filter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,-3) end
end