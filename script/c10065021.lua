local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_FIRE,1,1)
end
function s.lv3filter(c,tp)
	return c:IsLevel(3) and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.lv3filter,tp,LOCATION_MZONE,0,nil,tp)>=1
	and Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)>=1
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.DisableShuffleCheck()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,2,nil,tp)
	if #ag>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,ag,-1) end
	if Duel.SelectYesNo(tp,aux.Stringid(10061004,5)) then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local hc=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,1,1,nil,tp):GetFirst()
	Cookie7.hpdecktop(e,tp,eg,ep,ev,re,r,rp,hc,1)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end
end