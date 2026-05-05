if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_LIGHT,0,0)
end
function s.cookiefilter(c)
	return c:IsFaceup() and c:IsRace(RACE_WARRIOR)
end
function s.cookiefilter2(c)
	return c:IsRace(RACE_WARRIOR)
end
function s.goldfilter(c)
	return c:IsFaceup() and c:IsCode(table.unpack(CARD_GOLD_CHEESE))
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.cookiefilter2,tp,LOCATION_HAND,0,1,nil)
	and Duel.IsExistingMatchingCard(s.cookiefilter,tp,LOCATION_EXTRA,0,1,nil)
	and not Duel.IsExistingMatchingCard(Card.IsSetCard,tp,0,LOCATION_MZONE,1,nil,0xd10)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.goldfilter,tp,LOCATION_EXTRA,0,1,nil)
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local hg=Duel.SelectMatchingCard(tp,s.cookiefilter2,tp,LOCATION_HAND,0,1,1,nil)
	Duel.SendtoExtraP(hg,nil,REASON_COST)
	Duel.SendtoExtraP(e:GetHandler(),nil,REASON_COST)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.goldfilter,tp,LOCATION_EXTRA,0,0,1,nil)
	if #g>0 then Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,g)
	local curHP=g:GetFirst():GetOverlayCount()
	if curHP<6 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,g:GetFirst(),6-curHP) end end
end