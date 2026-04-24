if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WIND,0,0)
	if not s.global_check then
		s.global_check=true
		local ge1=Effect.CreateEffect(c)
		ge1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		ge1:SetCode(EVENT_TO_GRAVE)
		ge1:SetOperation(s.checkop)
		Duel.RegisterEffect(ge1,0)
	end
end
function s.checkop(e,tp,eg,ep,ev,re,r,rp)
	local ct0,ct1=0,0
	for tc in aux.Next(eg) do
		if (tc:IsPreviousLocation(LOCATION_REMOVED) or tc:IsPreviousLocation(LOCATION_OVERLAY))
			and tc:GetPreviousControler()~=nil then
			if tc:GetPreviousControler()==0 then
				ct0=ct0+1
			else
				ct1=ct1+1
			end
		end
	end
	for _=1,ct0 do
		Duel.RegisterFlagEffect(0,id,RESET_PHASE+PHASE_END,0,1)
	end
	for _=1,ct1 do
		Duel.RegisterFlagEffect(1,id,RESET_PHASE+PHASE_END,0,1)
	end
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFlagEffect(tp,id)>=2
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),1)
end