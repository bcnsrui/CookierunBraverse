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
	local draw=Duel.AnnounceNumber(tp,2,1,0)
	if draw==0 then return end
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,draw)
end