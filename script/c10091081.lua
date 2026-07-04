if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_DARK,2,2)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	for p=0,1 do
	local g=Duel.GetFieldGroup(p,LOCATION_GRAVE,0)
	if #g>0 then
	Duel.SendtoDeck(g,nil,SEQ_DECKSHUFFLE,REASON_EFFECT)
	Duel.ShuffleDeck(p) end	end
end