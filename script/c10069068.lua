if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_WIND,1,1)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local sc=Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local oc=Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)
	return sc<oc
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,-1)
end