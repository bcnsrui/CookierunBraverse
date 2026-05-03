if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,2,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_FIRE,0,0)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)>=1
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
	Duel.SendtoGrave(g,REASON_COST)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():GetOverlayCount()==1
end
function s.hp4filter(c,tp)
	return c:IsControler(tp) and c:IsRace(RACE_WARRIOR) and c:GetOverlayCount()<=4 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(s.hp4filter,tp,LOCATION_MZONE,0,nil,tp)
	Cookie7.Allhpaddop(e,tp,eg,ep,ev,re,r,rp,g,1)
end