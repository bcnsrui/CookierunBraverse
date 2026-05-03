if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,1,1)
	Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd014)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xd031)
	c:RegisterEffect(e2)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
	if #g>0 then Duel.SendtoDeck(g,nil,SEQ_DECKTOP,REASON_EFFECT) end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local opt=Duel.SelectOption(tp,aux.Stringid(10061002,3),aux.Stringid(10061002,4))
	if opt==0 then Duel.SendtoDeck(c,nil,SEQ_DECKTOP,REASON_EFFECT)
	else Duel.SendtoDeck(c,nil,SEQ_DECKBOTTOM,REASON_EFFECT) end
end