if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WATER,0,0)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,chk,ALL_COLOR,3,3)
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,3,3)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():IsDefensePos()
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.ChangePosition(c,POS_FACEUP_ATTACK)
	local rest=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,1,0,0)
	if #rest>0 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local g=rest:Select(tp,1,1,nil)
		Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
	end
end