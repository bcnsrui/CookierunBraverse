if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WATER,1,1,1,1)
end
function s.bluefilter(c)
	return c:IsAttribute(ATTRIBUTE_WATER)
end
function s.Stageeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.bluefilter,tp,LOCATION_HAND,0,nil)>=1
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(s.bluefilter,tp,LOCATION_HAND,0,nil)
	if #g==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local hg=g:Select(tp,0,#g,nil)
	if #hg>0 then
		Duel.SendtoGrave(hg,REASON_EFFECT)
		Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,#hg)
	end
	Duel.SendtoGrave(e:GetHandler(),REASON_EFFECT)
end
