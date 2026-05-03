if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_FIRE,0,0)
	if not s.global_check then
		s.global_check=true
		local ge1=Effect.CreateEffect(c)
		ge1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		ge1:SetCode(EVENT_DESTROYED)
		ge1:SetOperation(s.checkop)
		Duel.RegisterEffect(ge1,0)
	end
end
function s.redlv1filter(c,tp)
	return c:IsPreviousLocation(LOCATION_MZONE) and c:IsPreviousControler(tp)
		and c:IsAttribute(ATTRIBUTE_FIRE) and c:IsLevel(1)
end
function s.checkop(e,tp,eg,ep,ev,re,r,rp)
	for tc in aux.Next(eg) do
	local p=tc:GetPreviousControler()
	if s.redlv1filter(tc,p) and Duel.GetTurnPlayer()~=p then
	Duel.RegisterFlagEffect(p,id,RESET_PHASE+PHASE_END,0,2) end	end
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFlagEffect(tp,id)>0
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,e:GetHandler(),1)
end