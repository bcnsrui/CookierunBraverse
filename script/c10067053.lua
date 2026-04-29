if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,1,2)
	Cookie6.IGCoookieEffect(c,1,ALL_COLOR,0,0)
end
function s.arenafilter(c)
	return c:IsSetCard(0xc01)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0):Filter(s.arenafilter,nil):GetCount()>=5
	and e:GetHandler():IsPosition(POS_FACEUP_DEFENSE)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.ChangePosition(e:GetHandler(),POS_FACEUP_ATTACK)
end