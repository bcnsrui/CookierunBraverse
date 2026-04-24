if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,1,1)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_WATER,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.arenafilter(c)
	return c:IsSetCard(0xc01)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.GetMatchingGroupCount(s.arenafilter,tp,LOCATION_HAND,0,nil)>=2
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.arenafilter,tp,LOCATION_HAND,0,2,2,nil)
	if #g>0 then Duel.ConfirmCards(1-tp,g) end
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=5
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local count=Duel.AnnounceNumber(tp,2,1,0)
	if count==0 then return end
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count)
end
