if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,2,2)
	Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd024)
	c:RegisterEffect(e1)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetFieldGroupCount(1-tp,LOCATION_GRAVE,0)>=20 and Duel.SelectYesNo(tp,aux.Stringid(10060001,8)) then
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end
end