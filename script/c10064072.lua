if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb00)
	c:RegisterEffect(e1)
end
function s.FlipCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local g=Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)
	local decktop=Duel.GetDecktopGroup(tp,math.min(g,3))
	Duel.SendtoDeck(decktop,nil,SEQ_DECKTOP,REASON_EFFECT)
	if #decktop>1 then Duel.SortDecktop(tp,tp,#decktop) end
end