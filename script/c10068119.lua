if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,1,1)
	Cookie6.IGCoookieEffect(c,0,ATTRIBUTE_DARK,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xc05)
	c:RegisterEffect(e1)
end
function s.darkcookiefilter(c)
	return c:IsCode(table.unpack(CARD_DARK_CACAO)) and c:IsRace(RACE_WARRIOR)
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler())
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
	and Duel.IsExistingMatchingCard(s.darkcookiefilter,tp,LOCATION_GRAVE,0,1,nil)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=Duel.SelectMatchingCard(tp,s.darkcookiefilter,tp,LOCATION_GRAVE,0,0,1,nil)
	if #sg>0 then Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,sg:GetFirst()) end
end