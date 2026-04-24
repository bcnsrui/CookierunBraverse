if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
	Cookie6.IGCoookieEffect(c,0,ATTRIBUTE_WIND,3,3)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if c:IsLocation(LOCATION_MZONE) and ally then
		Duel.Overlay(ally,c)
	end
end