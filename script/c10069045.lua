if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_LIGHT,2,2)
end
function s.flipyellow(c)
	return c:IsRace(RACE_WARRIOR) and c:IsSetCard(0xb00)
end
function s.Trapcost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.GetMatchingGroupCount(s.flipyellow,tp,LOCATION_HAND,0,nil)>=2
end
function s.Trapcostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.flipyellow,tp,LOCATION_HAND,0,2,2,nil)
	Duel.SendtoGrave(g,REASON_COST)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil,tp)
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #ag>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,ag,-2) end
	local draw=Duel.AnnounceNumber(tp,2,1,0)
	if draw>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,draw) end
end