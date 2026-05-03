if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_LIGHT,2,2)
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,nil,tp)
	Cookie7.Allhpaddop(e,tp,eg,ep,ev,re,r,rp,g,1)
end