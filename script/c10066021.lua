local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_FIRE,1,1,1,1)
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
end
function s.filter(c,tp)
	return c:GetLevel()>=2 and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp) and c:GetOverlayCount()<=3
end
function s.Stageeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.filter,tp,LOCATION_MZONE,0,nil,tp)>=1
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.filter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #ag>0 then
	local tc=ag:GetFirst()
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,tc,1)
	if tc:GetOverlayCount()==1 then
	local count=Duel.AnnounceNumber(tp,1,0)
	if count==1 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end end end
end