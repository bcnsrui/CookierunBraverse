if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_EARTH,3,3)
	Cookie6.QECoookieEffect2(c)
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_QUICK_O)
	e0:SetCode(EVENT_FREE_CHAIN)
	e0:SetRange(LOCATION_HAND)
	e0:SetCondition(s.Summoncon)
	e0:SetTarget(Cookie3.notg)
	e0:SetOperation(s.Summonop)
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
end
function s.SPSummonfilter(c,tp)
	return c:IsAttribute(ATTRIBUTE_EARTH) and c:IsRace(RACE_WARRIOR)
	and c:IsLevel(1) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Summoncon(e)
	local tp=e:GetHandlerPlayer()
	return Cookie2.Summoncon(e)
	and Duel.IsExistingMatchingCard(s.SPSummonfilter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.Summonop(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	local e1=Effect.CreateEffect(ally)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xa21)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
	ally:RegisterEffect(e1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.SPSummonfilter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	if #g>0 then Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,g)	end
	Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler())
end
function s.blackgravefilter(c)
	return c:IsAttribute(ATTRIBUTE_EARTH) and c:IsRace(RACE_WARRIOR)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=5 then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.blackgravefilter,tp,LOCATION_GRAVE,0,0,1,nil)
	if #g>0 then
		Duel.SendtoHand(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
	end end
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,0,ALL_COLOR,1,1)
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,1,1)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(nil,1-tp,LOCATION_EMZONE,0,nil):GetFirst()
	if not ally then return end
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_CLIENT_HINT)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xa181)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
	ally:RegisterEffect(e1)
end