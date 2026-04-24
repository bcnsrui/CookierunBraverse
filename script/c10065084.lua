if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,2,2)
	Cookie6.IGCoookieEffect(c,0,ATTRIBUTE_WATER,0,0)
end
function s.othergreenfilter(c,exc,tp)
	return c~=exc and c:IsAttribute(ATTRIBUTE_WATER) and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.restcon(e,tp,eg,ep,ev,re,r,rp,chk) and Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,chk,ALL_COLOR,1,1)
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.ChangePosition(e:GetHandler(),POS_FACEUP_DEFENSE)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,1,1)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.othergreenfilter,tp,LOCATION_MZONE,0,1,1,nil,e:GetHandler(),tp)
	if #g>0 then Duel.ChangePosition(g,POS_FACEUP_ATTACK) end
end