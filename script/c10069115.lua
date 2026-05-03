if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_DARK,1,1)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local dr=Duel.AnnounceNumber(tp,1,0)
	if dr>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,dr) end
	if Duel.GetFieldGroupCount(1-tp,LOCATION_GRAVE,0)<=15 then
	Cookie3.CookieTrashop(e,1-tp,eg,ep,ev,re,r,rp,3) end
end