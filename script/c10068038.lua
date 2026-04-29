if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,1,1)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_LIGHT,0,0)
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_SINGLE)
	e0:SetCode(EFFECT_ADD_SETCODE)
	e0:SetValue(0xd011)
	c:RegisterEffect(e0)
end
function s.lv3filter(c)
	return c:IsLevel(3) and c:IsRace(RACE_WARRIOR)
end
function s.lv1filter(c)
	return c:IsLevel(1) and c:IsRace(RACE_WARRIOR)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.lv3filter,tp,LOCATION_HAND,0,1,nil)
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local hg=Duel.SelectMatchingCard(tp,s.lv3filter,tp,LOCATION_HAND,0,1,1,nil)
	if #hg>0 then Duel.SendtoExtraP(hg,nil,REASON_COST) end
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.lv1filter,tp,LOCATION_EXTRA,0,1,nil)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.lv1filter,tp,LOCATION_EXTRA,0,0,2,nil)
	if #g>0 then Duel.SendtoGrave(g,REASON_EFFECT) end
end