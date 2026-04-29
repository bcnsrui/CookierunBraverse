if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WATER,1,1,1,1)
end
function s.bluefilter(c)
	return c:IsAttribute(ATTRIBUTE_WATER)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.SendtoGrave(c,REASON_COST)
	local handcount=Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)
	if handcount==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local hg=Duel.SelectMatchingCard(tp,s.bluefilter,tp,LOCATION_HAND,0,0,handcount,nil)
	local discarded=#hg
	if discarded>0 then
		Duel.SendtoGrave(hg,REASON_COST)
		Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,discarded)
	end
end