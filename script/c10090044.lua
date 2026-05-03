if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_LIGHT,1,1)
end
function s.yellowfilter(c,tp)
	return c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),1)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.yellowfilter,tp,LOCATION_MZONE,0,2,nil,tp)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.yellowfilter,tp,LOCATION_MZONE,0,0,1,e:GetHandler(),tp)
	if #g>0 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,g,1) end
end