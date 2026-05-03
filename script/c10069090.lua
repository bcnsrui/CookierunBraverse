if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WATER,1,1)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.DisableShuffleCheck()
	local g=Duel.GetDecktopGroup(tp,3)
	if #g<3 then return end
	Duel.ConfirmCards(tp,g)
	Duel.SortDecktop(tp,tp,3)
end