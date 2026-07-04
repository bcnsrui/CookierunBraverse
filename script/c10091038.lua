if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WIND,0,0)
end
function s.shinemuscatfilter(c,tp)
	return c:IsCode(table.unpack(CARD_SHINE_MUSCAT_COOKIE)) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.shinemuscatfilter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,1,0,0)>=1 then
	local rest=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,1,0,0)
	if #rest==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=rest:Select(tp,1,1,nil)
	if #g>0 then Duel.Remove(g,POS_FACEUP,REASON_EFFECT) end end
end