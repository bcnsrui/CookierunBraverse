if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb00)
	c:RegisterEffect(e1)
end
function s.ARhealfilter(c)
	return c:IsSetCard(0xc01) and c:IsAttribute(ATTRIBUTE_WATER) and c:IsRace(RACE_WARRIOR)
end
function s.FlipCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.ARhealfilter,tp,LOCATION_MZONE,0,1,nil)
end
function s.FlipCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local hg=e:GetLabelObject()
	if not hg then return end
	if hg:GetLevel()<2 then return end
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,hg,1)
end
