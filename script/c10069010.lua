if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,2,2)
	Cookie6.QECoookieEffect2(c)
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
	e1:SetValue(0xd014)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xd03)
	c:RegisterEffect(e2)
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
function s.Summoncon(e)
	local tp=e:GetHandlerPlayer()
	return Cookie8.ExtraSummoncon(e) and Duel.GetFlagEffect(tp,id)>=2
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally:IsSetCard(0xa15) then return end
	if Duel.GetFieldGroupCount(1-tp,LOCATION_HAND,0)==0 then return end
	local count=Duel.AnnounceNumber(tp,1,0)
	if count==0 then return end
	local g=Duel.GetFieldGroup(1-tp,LOCATION_HAND,0):RandomSelect(tp,count)
	Duel.DisableShuffleCheck()
	if #g>0 then Duel.SendtoDeck(g,nil,SEQ_DECKTOP,REASON_RULE)
	Cookie7.faceuphpaddop(e,tp,eg,ep,ev,re,r,rp,1-tp,e:GetHandler(),1) end
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ATTRIBUTE_FIRE,0,1)
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_FIRE,0,1)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally:IsSetCard(0xa15) then return end
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g==0 then return end
	local tc=g:GetFirst()
	if tc:GetOverlayCount()==0 then return end
	local og=tc:GetOverlayGroup()
	local top=og:GetFirst()
	for oc in aux.Next(og) do
		if oc:GetSequence()>top:GetSequence() then top=oc end
	end
	Duel.DisableShuffleCheck()
	Duel.SendtoDeck(top,nil,SEQ_DECKTOP,REASON_RULE)
	Cookie7.faceuphpaddop(e,tp,eg,ep,ev,re,r,rp,1-tp,e:GetHandler(),1)
end