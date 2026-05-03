if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,2,2)
end
function s.saintfilter(c)
	return c:IsCode(table.unpack(CARD_WHITE_LILY))
end
function s.Itemcost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.saintfilter,tp,LOCATION_HAND+LOCATION_GRAVE,0,1,nil)
end
function s.Itemcostoperation(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.saintfilter,tp,LOCATION_HAND+LOCATION_GRAVE,0,1,1,nil)
	if #g>0 then Duel.Overlay(ally,g) end
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local ct=Duel.AnnounceNumber(tp,1,0)
	if ct>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,ct) end
end