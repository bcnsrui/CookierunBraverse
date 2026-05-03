if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,3,3)
	Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd014)
	c:RegisterEffect(e1)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local allybrk=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	local oppbrk=Duel.GetMatchingGroup(Card.IsFaceup,1-tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	if allybrk<=oppbrk then return end
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),1)
end