if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,2)
	Cookie6.IGCoookieEffect(c,0,ATTRIBUTE_LIGHT,1,1)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.restcon(e,tp,eg,ep,ev,re,r,rp,chk) and Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,chk,ALL_COLOR,1,1)
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.ChangePosition(e:GetHandler(),POS_FACEUP_DEFENSE)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,1,1)
end
function s.lv1skillfilter(c,tp)
	return (c:IsSetCard(0xc05) or c:IsSetCard(0xb00)) and c:IsRace(RACE_WARRIOR)
	and c:IsLevel(1) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.SelectMatchingCard(tp,s.lv1skillfilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie3.Cookiedestroyop(e,tp,eg,ep,ev,re,r,rp,g) end
end