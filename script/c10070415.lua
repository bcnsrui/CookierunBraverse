local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ASCookieEffect(c,ATTRIBUTE_WATER,2,2)
end
function s.andoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not c:IsLocation(LOCATION_MZONE) then return end
	if not Duel.SelectYesNo(tp,aux.Stringid(10060001,8)) then return end
	Duel.Draw(tp,1,REASON_EFFECT)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
end