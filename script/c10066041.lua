local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_LIGHT,3,3)
end
function s.brakefilter(c)
	return c:IsFaceup() and c:IsRace(RACE_WARRIOR)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local brakecookie=Duel.GetMatchingGroupCount(s.brakefilter,tp,LOCATION_EXTRA,0,nil)
	return brakecookie>=3
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,2)
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,8)) then
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end
end