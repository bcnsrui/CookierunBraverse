if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_FIRE,0,0)
	if not s.global_check then
		s.global_check=true
		local ge1=Effect.CreateEffect(c)
		ge1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		ge1:SetCode(EVENT_DESTROYED)
		ge1:SetOperation(s.checkop)
		Duel.RegisterEffect(ge1,0)
	end
end
function s.checkop(e,tp,eg,ep,ev,re,r,rp)
	for tc in aux.Next(eg) do
		if tc:IsPreviousLocation(LOCATION_MZONE) and tc:IsLocation(LOCATION_EXTRA) and tc:IsRace(RACE_WARRIOR) then
			Duel.RegisterFlagEffect(tc:GetPreviousControler(),id,RESET_PHASE+PHASE_END,0,1)
		end
	end
end
function s.Trapcost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ATTRIBUTE_FIRE,1,1)
	or Duel.GetFlagEffect(tp,id)>0
end
function s.Trapcostoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetFlagEffect(tp,id)>0 then return end
	return Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_FIRE,1,1)
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,-1) end
end