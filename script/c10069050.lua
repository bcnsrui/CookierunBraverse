if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WIND,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
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
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	local g=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,1,0,0)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=g:Select(tp,0,1,nil)
	if #sg>0 then Duel.Remove(sg,POS_FACEUP,REASON_EFFECT) end
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)>=2
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=g:Select(tp,2,2,nil)
	if #sg>0 then Duel.SendtoGrave(sg,REASON_COST) end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)
	Cookie7.Alldamageeff(e,tp,eg,ep,ev,re,r,rp,g,1)
end