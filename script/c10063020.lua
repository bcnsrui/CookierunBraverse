local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_FIRE,1,2)
end
function s.hpcookiefilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsAttribute(ATTRIBUTE_FIRE) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.hpcookiefilter,tp,LOCATION_MZONE,0,nil,tp)>=1
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.DisableShuffleCheck()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.hpcookiefilter,tp,LOCATION_MZONE,0,0,1,nil,tp):GetFirst()
	local hp=math.min(g:GetOverlayCount(),3)
	local options={}
	for i=0,hp do table.insert(options,i) end
	local count=Duel.AnnounceNumber(tp,table.unpack(options))
	if count==0 then return end
	Cookie7.hpdecktop(e,tp,eg,ep,ev,re,r,rp,g,count)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count)
end