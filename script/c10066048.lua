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
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local ally=Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local enemy=Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)
	if ally>=enemy then return end
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
	if Duel.GetFieldGroupCount(1-tp,LOCATION_HAND,0)==0 then return end
	Duel.Hint(HINT_SELECTMSG,1-tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(1-tp,nil,1-tp,LOCATION_HAND,0,1,1,nil)
	if #g>0 then Duel.SendtoGrave(g,REASON_EFFECT) end
end