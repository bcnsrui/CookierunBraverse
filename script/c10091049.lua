if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,1,1)
end
function s.windarcherfilter(c)
	return c:IsCode(table.unpack(CARD_WIND_ARCHER_COOKIE)) and c:IsRace(RACE_WARRIOR)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=Duel.SelectMatchingCard(tp,s.windarcherfilter,tp,LOCATION_GRAVE,0,0,1,nil)
	if #sg>0 then Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,sg:GetFirst()) end
end