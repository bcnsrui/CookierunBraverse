if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WATER,3,3)
end
function s.lv2filter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:GetLevel()<=2 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Itemcost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.lv2filter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.Itemcostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.lv2filter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	if #g>0 then Duel.SendtoDeck(g,nil,SEQ_DECKBOTTOM,REASON_COST) end
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local ct=Duel.AnnounceNumber(tp,2,1,0)
	if ct==0 then return end
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,ct)
end