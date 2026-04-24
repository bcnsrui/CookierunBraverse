if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WATER,1,1,2,2)
end
function s.restfilter(c,tp)
	return c:IsDefensePos() and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Stageeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.restfilter,tp,LOCATION_MZONE,0,nil,tp)>=3
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,7))
	local count=Duel.AnnounceNumber(tp,3,2,1,0)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count)
end
