if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,1,3)
	Cookie6.IGCoookieEffect(c,1,ALL_COLOR,0,0)
end
function s.arenacookiefilter(c)
	return c:IsSetCard(0xc01) and c:IsRace(RACE_WARRIOR)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0):Filter(s.arenacookiefilter,nil)
	if #g==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=g:Select(tp,0,1,nil)
	if #ag>0 then Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,ag) end
end