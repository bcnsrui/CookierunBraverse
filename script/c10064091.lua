if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,2,2)
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_SINGLE)
	e0:SetCode(EFFECT_ADD_SETCODE)
	e0:SetValue(0xc05)
	c:RegisterEffect(e0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd031)
	c:RegisterEffect(e1)
end
function s.notflipfilter(c)
	return not c:IsSetCard(0xb00)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.SelectMatchingCard(tp,s.notflipfilter,tp,LOCATION_GRAVE,0,0,3,nil)
	if #g>0 then
		Duel.SendtoDeck(g,nil,SEQ_DECKBOTTOM,REASON_EFFECT)
		if #g>1 then Duel.SortDeckbottom(tp,tp,#g) end
	end
end





