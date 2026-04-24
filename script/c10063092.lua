local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WATER,3,3)
end
function s.lv2cookiefilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsLevel(2) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local count=Duel.GetMatchingGroupCount(s.lv2cookiefilter,tp,LOCATION_MZONE,LOCATION_MZONE,nil,tp)
	if count>0 then	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count) end
end