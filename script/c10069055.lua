if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WIND,0,0)
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_QUICK_O)
	e0:SetCode(EVENT_FREE_CHAIN)
	e0:SetRange(LOCATION_EXTRA)
	e0:SetCondition(s.Summoncon)
	e0:SetTarget(Cookie3.notg)
	e0:SetOperation(Cookie8.ExtraSummonop)
	c:RegisterEffect(e0)
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
function s.Summoncon(e)
	local tp=e:GetHandlerPlayer()
	return Cookie8.ExtraSummoncon(e)
		and Cookie3.SupportAreaCount(e,tp,nil,nil,nil,nil,nil,nil,0,0,1,1)>=3
		and Duel.GetFlagEffect(tp,id)>=2
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)<=5
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.DisableShuffleCheck()
	local dt=Duel.GetDecktopGroup(tp,1)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally then Duel.Overlay(ally,dt) end
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)>=1
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	local mana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=mana:Select(tp,1,1,nil)
	if #g>0 then Duel.SendtoHand(g,nil,REASON_COST)
	Duel.ConfirmCards(1-tp,g) end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #ag>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,ag,1) end
end