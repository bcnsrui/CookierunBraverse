local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ASCookieEffect(c,ATTRIBUTE_WIND,2,2)
end
function s.filter(c)
	return c:IsLevel(1) and c:IsRace(RACE_WARRIOR)
end
function s.andoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not c:IsLocation(LOCATION_MZONE) then return end
	if not Duel.SelectYesNo(tp,aux.Stringid(id,0)) then return end
	local cost2=Cookie3.manacostcon(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WIND,1,1)
	if cost2 then
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WIND,1,1)
	local support=Duel.GetFieldGroupCount(tp,LOCATION_REMOVED,0)
	if support<7 then return end
	local ag=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,e:GetHandler())
	if #ag>0 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,ag:GetFirst(),1) end
end