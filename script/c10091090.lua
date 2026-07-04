if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ALL_COLOR,0,3)
	Cookie6.IGCoookieEffect(c,0,ALL_COLOR,0,0)
end
function s.archangelfilter(c)
	return c:IsCode(10091091) and c:IsRace(RACE_WARRIOR)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.archangelfilter,tp,LOCATION_EXTRA,0,1,nil)
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.Cookiedestroyop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler())
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.archangelfilter,tp,LOCATION_EXTRA,0,1,1,nil)
	if #g==0 then return end
	local tc=g:GetFirst()
	Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,tc)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,tc,3)
end