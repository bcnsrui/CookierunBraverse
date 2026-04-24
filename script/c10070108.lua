if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,1,1)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_FIRE,2,2)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():IsAttackPos()
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.ChangePosition(c,POS_FACEUP_DEFENSE)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,2,nil,tp)
	Cookie7.doubledamageeff(e,tp,eg,ep,ev,re,r,rp,g,1,1)
end