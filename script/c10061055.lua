if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie4.DRTCookieEffect(c,ATTRIBUTE_WIND,2,2)
end