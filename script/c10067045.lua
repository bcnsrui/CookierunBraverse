if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,1,1)
	Cookie6.QECoookieEffect(c,ALL_COLOR,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.arenacookiefilter(c)
	return c:IsSetCard(0xc01) and c:IsRace(RACE_WARRIOR)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0):Filter(s.arenacookiefilter,nil)
	if #g==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=g:Select(tp,0,1,nil)
	if #ag>0 then Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,ag) end
end