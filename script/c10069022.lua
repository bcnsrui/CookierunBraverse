if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_FIRE,1,1)
end
function s.enemyoverlayfilter(c,tp)
	return c:IsRace(RACE_WARRIOR)
		and c:GetOverlayGroup():IsExists(function(mc) return mc:GetOwner()==1-tp end,1,nil)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)>=1
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #ag>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,ag,-1) end
	if Duel.IsExistingMatchingCard(s.enemyoverlayfilter,tp,LOCATION_MZONE,0,1,nil,tp) then
		local draw=Duel.AnnounceNumber(tp,1,0)
		if draw>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,draw) end
	end
end