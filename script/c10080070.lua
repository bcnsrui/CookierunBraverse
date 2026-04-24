if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,1,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_FIRE,0,0)
end
function s.lv1filter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsLevel(1) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return e:GetHandler():GetOverlayCount()>=2
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),2)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroup(s.lv1filter,tp,0,LOCATION_MZONE,nil,tp):GetCount()>=1
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.lv1filter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1) end
end