if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,1,2)
	Cookie6.IGCoookieEffect(c,0,ATTRIBUTE_WIND,0,0)
	if not s.global_check then
		s.global_check=true
		local ge1=Effect.CreateEffect(c)
		ge1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		ge1:SetCode(EVENT_MOVE)
		ge1:SetOperation(s.checkop)
		Duel.RegisterEffect(ge1,0)
	end
end
function s.checkop(e,tp,eg,ep,ev,re,r,rp)
	local ct0,ct1=0,0
	for tc in aux.Next(eg) do
		if tc:IsLocation(LOCATION_GRAVE)
			and (tc:IsPreviousLocation(LOCATION_REMOVED) or tc:IsPreviousLocation(LOCATION_OVERLAY)) then
			local p=tc:GetPreviousControler()
			if p==nil or p>1 then p=tc:GetOwner() end
			if p==0 then ct0=ct0+1
			elseif p==1 then ct1=ct1+1 end
		end
	end
	for _=1,ct0 do Duel.RegisterFlagEffect(0,id,RESET_PHASE+PHASE_END,0,1) end
	for _=1,ct1 do Duel.RegisterFlagEffect(1,id,RESET_PHASE+PHASE_END,0,1) end
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFlagEffect(tp,id)>=2
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler())
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local draw=Duel.AnnounceNumber(tp,2,1,0)
	if draw>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,draw) end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local hg=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
	if #hg>0 then Duel.SendtoGrave(hg,REASON_EFFECT) end
end