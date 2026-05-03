if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,3,3)
	Cookie6.QECoookieEffect2(c)
	local e0=Effect.CreateEffect(c)
	e0:SetDescription(aux.Stringid(10061004,0))
	e0:SetType(EFFECT_TYPE_QUICK_O)
	e0:SetCode(EVENT_FREE_CHAIN)
	e0:SetRange(LOCATION_EXTRA)
	e0:SetHintTiming(TIMING_BATTLE_PHASE,TIMING_BATTLE_PHASE)
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
	e2:SetValue(0xd031)
	c:RegisterEffect(e2)
end
function s.Summoncon(e)
	local tp=e:GetHandlerPlayer()
	return Cookie8.ExtraSummoncon(e) and Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=2
end
function s.bluelv2filter(c,tp)
	return c:IsAttribute(ATTRIBUTE_WATER) and c:GetLevel()<=2
	and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.bluelv2filter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #ag>0 then
		Duel.SendtoHand(ag,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,ag)
		Duel.ShuffleHand(tp)
	end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local count=Duel.AnnounceNumber(tp,2,1,0)
	if count>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count) end
end