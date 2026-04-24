if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,2)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_LIGHT,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.handylv2(c)
	return c:IsRace(RACE_WARRIOR) and c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsLevelAbove(2)
end
function s.extraylv2(c)
	return c:IsFaceup() and c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsRace(RACE_WARRIOR) and c:GetLevel()==2
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.handylv2,tp,LOCATION_HAND,0,1,nil)
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.handylv2,tp,LOCATION_HAND,0,1,1,nil)
	if #g>0 then Duel.SendtoExtraP(g,nil,REASON_COST) end
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.extraylv2,tp,LOCATION_EXTRA,0,0,1,nil)
	if #g>0 then Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,g) end
end