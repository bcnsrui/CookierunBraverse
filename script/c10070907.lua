if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WATER,0,0)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=3
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local count=Duel.AnnounceNumber(tp,1,0)
	if count==1 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end
end