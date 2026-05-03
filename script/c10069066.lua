if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,1,1)
end
function s.Itemcost(e,tp,eg,ep,ev,re,r,rp,chk)
	local mana=Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	return mana>=1
end
function s.Itemcostoperation(e,tp,eg,ep,ev,re,r,rp)
	local mana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=mana:Select(tp,1,1,nil)
	Duel.SendtoGrave(g,REASON_COST)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #g>0 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,g,1) end
end