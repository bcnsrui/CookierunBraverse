if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_EARTH,1,1,0,0)
end
function s.Stageeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	return ally and ally:IsSetCard(0xa21)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local count=Duel.AnnounceNumber(tp,1,0)
	if count>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count) end
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)>0 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
		local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
		if #g>0 then Duel.SendtoGrave(g,REASON_COST) end
	end
end