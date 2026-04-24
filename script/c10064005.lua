if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_FIRE,0,0)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return e:GetHandler():GetOverlayCount()>0
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),1)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)
	Cookie7.Alldamageeff(e,tp,eg,ep,ev,re,r,rp,g,1)
end