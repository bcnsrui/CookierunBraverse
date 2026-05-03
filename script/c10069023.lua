if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_FIRE,1,1,1,1)
end
function s.enemyoverlayfilter(c,tp)
	return c:IsRace(RACE_WARRIOR)
		and c:GetOverlayGroup():IsExists(function(mc) return mc:GetOwner()==1-tp end,1,nil)
end
function s.Stageeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.enemyoverlayfilter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,2,nil,tp)
	if #g>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,1) end
end