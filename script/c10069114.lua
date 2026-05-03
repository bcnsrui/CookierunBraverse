if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_DARK,1,1)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local ct=Duel.GetFieldGroupCount(tp,LOCATION_GRAVE,0)
	if ct<=14 then Cookie3.CookieTrashop(e,tp,eg,ep,ev,re,r,rp,5)
	else Cookie3.CookieTrashop(e,1-tp,eg,ep,ev,re,r,rp,3) end
end