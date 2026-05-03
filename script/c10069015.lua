if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,2,2)
	Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd024)
	c:RegisterEffect(e1)
end
function s.handcookiefilter(c)
	return c:IsRace(RACE_WARRIOR)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.handcookiefilter,tp,LOCATION_HAND,0,1,nil)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=Duel.SelectMatchingCard(tp,s.handcookiefilter,tp,LOCATION_HAND,0,0,1,nil)
	if #sg>0 then Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,sg) end
	Cookie7.hpdecktop(e,tp,eg,ep,ev,re,r,rp,sg,1)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
end