if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,3,3)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_LIGHT,0,0)
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_SINGLE)
	e0:SetCode(EFFECT_ADD_SETCODE)
	e0:SetValue(0xd011)
	c:RegisterEffect(e0)
end
function s.cookiefilter(c)
	return c:IsRace(RACE_WARRIOR)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.cookiefilter,tp,LOCATION_GRAVE,0,1,nil)
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local sg=Duel.SelectMatchingCard(tp,s.cookiefilter,tp,LOCATION_GRAVE,0,1,1,nil)
	if #sg>0 then
	e:SetLabel(sg:GetFirst():GetLevel())
	Duel.SendtoExtraP(sg,nil,REASON_COST) end
end
function s.lvfilter(c,lv)
	return c:IsFaceup() and c:IsRace(RACE_WARRIOR) and c:GetLevel()==lv
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local lv=e:GetLabel()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.lvfilter,tp,LOCATION_EXTRA,0,0,1,nil,lv)
	if #g>0 then Duel.SendtoGrave(g,REASON_EFFECT) end
end