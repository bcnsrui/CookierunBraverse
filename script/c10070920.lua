if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WATER,1,1,0,0)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=3 then
	local count=Duel.AnnounceNumber(tp,1,0)
	if count==1 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end end
end