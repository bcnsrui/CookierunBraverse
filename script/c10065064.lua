if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,3,3)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	local count=Duel.AnnounceNumber(tp,1,0)
	if count==1 then
	local g=Duel.GetDecktopGroup(tp,1)
	Duel.Overlay(ally,g) end
	local supportarea=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	if #supportarea>=7 then
	local draw=Duel.AnnounceNumber(tp,1,0)
	if draw==1 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end end
end