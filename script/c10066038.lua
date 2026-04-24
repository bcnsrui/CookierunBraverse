if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
end
function s.lv2yellowfilter(c)
	return c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsRace(RACE_WARRIOR) and c:IsLevelAbove(2)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.IsExistingMatchingCard(s.lv2yellowfilter,tp,LOCATION_EXTRA,0,1,nil) then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1) end end
end