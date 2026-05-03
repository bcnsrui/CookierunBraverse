if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WATER,2,2)
end
function s.shadow_milk_filter(c)
	return c:IsCode(table.unpack(CARD_SHADOW_MILK))
end
function s.Itemcost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.shadow_milk_filter,tp,LOCATION_HAND,0,1,nil)
end
function s.Itemcostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local rc=Duel.SelectMatchingCard(tp,s.shadow_milk_filter,tp,LOCATION_HAND,0,1,1,nil)
	if #rc>0 then Duel.ConfirmCards(1-tp,rc) end
end
function s.lv2blue(c,tp)
	return c:IsAttribute(ATTRIBUTE_WATER) and c:IsRace(RACE_WARRIOR)
		and c:IsLevelBelow(2) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_RTOHAND)
	local bg=Duel.SelectMatchingCard(tp,s.lv2blue,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #bg>0 then Duel.SendtoHand(bg,nil,REASON_EFFECT)
	Duel.ConfirmCards(1-tp,bg) end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=Duel.SelectMatchingCard(tp,s.shadow_milk_filter,tp,LOCATION_HAND,0,1,1,nil)
	if #sg>0 then Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,sg) end
end