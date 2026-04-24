if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_LIGHT,1,1)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local lvsum=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	if lvsum<=2 and Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=6 then
	local count=Duel.AnnounceNumber(tp,1,0)
	if count==0 then return end
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count) end
end