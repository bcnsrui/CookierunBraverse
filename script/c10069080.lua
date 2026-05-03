if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,1,2)
	Cookie6.IGCoookieEffect(c,0,ATTRIBUTE_WATER,0,0)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local g=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	return g:FilterCount(Card.IsAttribute,nil,ATTRIBUTE_WATER)>=0
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.SendtoDeck(e:GetHandler(),nil,SEQ_DECKBOTTOM,REASON_COST)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.DisableShuffleCheck()
	local g=Duel.GetDecktopGroup(tp,1)
	if #g==0 then return end
	Duel.ConfirmCards(tp,g)
	local opt=Duel.SelectOption(tp,aux.Stringid(10061002,3),aux.Stringid(10061002,4))
	if opt==1 then Duel.MoveSequence(g:GetFirst(),opt) end
end