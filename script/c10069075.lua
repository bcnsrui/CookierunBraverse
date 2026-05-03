if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,3,3)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
end
function s.lv2blue(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsAttribute(ATTRIBUTE_WATER) and c:IsLevelBelow(2)
	and Cookie3.NoEmFzonefilter(c,tp)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.lv2blue,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #g==0 then return end
	local opt=Duel.SelectOption(tp,aux.Stringid(10061002,3),aux.Stringid(10061002,4))
	if opt==0 then Duel.SendtoDeck(g,nil,SEQ_DECKTOP,REASON_EFFECT)
	else Duel.SendtoDeck(g,nil,SEQ_DECKBOTTOM,REASON_EFFECT) end
end