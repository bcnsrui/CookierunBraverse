if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_LIGHT,1,1,0,0)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_LIGHT,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd133)
	c:RegisterEffect(e1)
end
function s.filter(c)
	return c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsRace(RACE_WARRIOR)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.filter,tp,LOCATION_HAND,0,1,nil)
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.filter,tp,LOCATION_HAND,0,1,1,nil)
	if #g>0 then Duel.SendtoExtraP(g,nil,REASON_COST) end
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local mana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,1,0,0)
	if #mana>0 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local tc=mana:Select(tp,0,2,nil)
		Duel.Remove(tc,POS_FACEUP,REASON_EFFECT) end
	local count=Duel.AnnounceNumber(tp,1,0)
	if count==1 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count) end
end