if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,2,2)
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_SINGLE)
	e0:SetCode(EFFECT_ADD_SETCODE)
	e0:SetValue(0xb00)
	c:RegisterEffect(e0)
end
function s.FlipCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,2)
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<2 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,2,2,nil)
	if #g~=2 then return end
	local loc=Duel.SelectOption(tp,aux.Stringid(10061002,3),aux.Stringid(10061002,4))
	Duel.DisableShuffleCheck()
	if loc==0 then Duel.SendtoDeck(g,nil,SEQ_DECKTOP,REASON_EFFECT)
	Duel.SortDecktop(tp,tp,2)
	else Duel.SendtoDeck(g,nil,SEQ_DECKBOTTOM,REASON_EFFECT)
	Duel.SortDeckbottom(tp,tp,2) end
end