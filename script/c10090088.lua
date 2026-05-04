if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WATER,1,1)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.DisableShuffleCheck()
	local g=Duel.GetDecktopGroup(tp,1)
	if #g==0 then return end
	Duel.ConfirmCards(tp,g)
	local opt=Duel.SelectOption(tp,aux.Stringid(10061002,3),aux.Stringid(10061002,4))
	if opt==1 then Duel.MoveSequence(g:GetFirst(),opt) end
	local ct=Duel.AnnounceNumber(tp,1,0)
	if ct>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,ct) end
end