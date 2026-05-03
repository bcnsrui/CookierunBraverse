if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,2,2)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)>=7
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local draw=Duel.AnnounceNumber(tp,3,2,1,0)
	if draw>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,draw) end
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local dg=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
	if #dg>0 then Duel.SendtoGrave(dg,REASON_EFFECT) end
end