if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
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
		ge1:SetCode(EVENT_CHAINING)
		ge1:SetOperation(s.checkop)
		Duel.RegisterEffect(ge1,0)
	end
end
function s.checkop(e,tp,eg,ep,ev,re,r,rp)
	local rc=re and re:GetHandler()
	if rc and rc:IsRace(RACE_SPELLCASTER) then
		Duel.RegisterFlagEffect(rp,id,RESET_PHASE+PHASE_END,0,1)
	end
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return e:GetHandler():IsAttackPos()
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.ChangePosition(e:GetHandler(),POS_FACEUP_DEFENSE)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFlagEffect(tp,id)>0 and Duel.IsExistingMatchingCard(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil,tp)
end
function s.windarcherfilter(c,tp)
	return c:IsCode(10062058,10064049,10070805) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,1,nil,tp)
	if #g>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1) end
	if Duel.IsExistingMatchingCard(s.windarcherfilter,tp,LOCATION_MZONE,0,1,nil,tp)
	and Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ATTRIBUTE_WIND,1,1)
	and Duel.SelectYesNo(tp,aux.Stringid(10060003,1)) then
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WIND,1,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.windarcherfilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #g>0 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,g,1) end end
end