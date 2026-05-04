if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,3,4)
	Cookie6.QECoookieEffect2(c)
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_QUICK_O)
	e0:SetCode(EVENT_FREE_CHAIN)
	e0:SetRange(LOCATION_EXTRA)
	e0:SetCondition(s.Summoncon)
	e0:SetTarget(Cookie3.notg)
	e0:SetOperation(s.Summonop)
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
function s.deck_bottom_only(tc)
	return tc:IsLocation(LOCATION_DECK) and tc:GetSequence()==0
end
function s.checkop(e,tp,eg,ep,ev,re,r,rp)
	for tc in aux.Next(eg) do
		if s.deck_bottom_only(tc) and tc:IsRace(RACE_WARRIOR)
			and (tc:IsPreviousLocation(LOCATION_MZONE) or tc:IsPreviousLocation(LOCATION_EXTRA)) then
			local p=tc:GetPreviousControler()
			if p==nil or p>1 then p=tc:GetOwner() end
			if p==0 or p==1 then Duel.RegisterFlagEffect(p,id,RESET_PHASE+PHASE_END,0,1) end
		end
	end
end
function s.Summoncon(e)
	local tp=e:GetHandlerPlayer()
	return Cookie8.ExtraSummoncon2(e) and Duel.GetFlagEffect(tp,id)>=1
	and Duel.IsExistingMatchingCard(s.pure_vanilla_filter,tp,LOCATION_MZONE,0,1,nil)
end
function s.pure_vanilla_filter(c)
	return c:IsCode(table.unpack(CARD_PURE_VANILLA)) and not c:IsCode(id)
end
function s.Summonop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local sc=Duel.SelectMatchingCard(tp,s.pure_vanilla_filter,tp,LOCATION_MZONE,0,1,1,nil):GetFirst()
	if not sc then return end
	c:SetMaterial(sc)
	local equipgroup=sc:GetEquipGroup()
	equipgroup:Merge(sc)
	Duel.Overlay(c,sc)
	Duel.SpecialSummon(c,0,tp,tp,false,false,POS_FACEUP_ATTACK)
	Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,c)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xa12)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
	ally:RegisterEffect(e1)
	for tc in aux.Next(equipgroup) do
		Duel.Equip(tp,tc,c)
		local e1=Effect.CreateEffect(tc)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_EQUIP_LIMIT)
		e1:SetReset(RESET_EVENT|RESETS_STANDARD)
		e1:SetValue(function(e,x) return x==e:GetLabelObject() end)
		e1:SetLabelObject(c)
		tc:RegisterEffect(e1)
		local e2=Effect.CreateEffect(tc)
		e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
		e2:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
		e2:SetCode(EVENT_LEAVE_FIELD)
		e2:SetOperation(function(e,tp,eg,ep,ev,re,r,rp) Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,tc)	end)
		e2:SetReset(RESET_TOGRAVE|RESET_REMOVE)
		tc:RegisterEffect(e2)
		if tc:IsCode(10063091) then
		local e3=Effect.CreateEffect(tc)
		e3:SetDescription(aux.Stringid(id,0))
		e3:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		e3:SetCode(EVENT_ATTACK_ANNOUNCE)
		e3:SetRange(LOCATION_SZONE)
		e3:SetCondition(s.drawcon)
		e3:SetOperation(s.drawop)
		e3:SetReset(RESET_EVENT+RESETS_STANDARD)
		tc:RegisterEffect(e3) end end
end
function s.drawcon(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():GetEquipTarget()==Duel.GetAttacker()
end
function s.drawop(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.DisableShuffleCheck()
	local g=Duel.GetDecktopGroup(tp,1)
	if #g==0 then return end
	Duel.ConfirmCards(1-tp,g)
	local tc=g:GetFirst()
	if tc and tc:IsAttribute(ATTRIBUTE_WATER) and tc:GetLevel()==2 then
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),2)
	local draw=Duel.AnnounceNumber(tp,2,1,0)
	if draw>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,draw) end end
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WATER,1,1)
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WATER,1,1)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #g>0 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,g,1) end
end