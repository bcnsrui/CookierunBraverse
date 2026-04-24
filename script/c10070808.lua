if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,3,3)
	Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd024)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xd031)
	c:RegisterEffect(e2)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local ally=Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local enemy=Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)
	return ally<=enemy
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local ally2=Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local enemy=Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)
	if ally2>enemy then return end
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if not ally then return end
	Duel.DisableShuffleCheck()
	local count=Duel.AnnounceNumber(tp,1,0)
	local tc=Duel.GetDecktopGroup(tp,count)
	Duel.Overlay(ally,tc)
end
function s.windarcherfilter(c,tp)
	return c:IsCode(10062058,10064049,10070805)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local support=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	if support:IsExists(s.windarcherfilter,1,nil) then
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
	Duel.SendtoGrave(g,REASON_EFFECT) end
end