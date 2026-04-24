if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_LIGHT,2,2,2,2)
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
end
function s.filter(c,tp)
	return c:GetLevel()>=2 and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.lv3lightfilter(c)
	return c:IsLevel(3) and c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsRace(RACE_WARRIOR)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.filter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	if #ag==0 then return end
	local tc=ag:GetFirst()
	local ct=Duel.GetMatchingGroupCount(s.lv3lightfilter,tp,LOCATION_EXTRA,0,nil)
	if ct>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,tc,ct) end
end
