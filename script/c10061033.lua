local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ASCookieEffect(c,ATTRIBUTE_LIGHT,2,2)
end
function s.filter(c)
	return c:IsLevel(2) and c:IsAttribute(ATTRIBUTE_LIGHT)
end
function s.andoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not c:IsLocation(LOCATION_MZONE) then return end
	local cost2=Cookie3.manacostcon(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,1,1)
	if not cost2 then return end
	if not Duel.SelectYesNo(tp,aux.Stringid(id,0)) then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil)
	local damage=Duel.GetMatchingGroupCount(s.filter,tp,LOCATION_EXTRA,0,nil)
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,damage)
end