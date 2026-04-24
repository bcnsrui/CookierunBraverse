if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,1,1)
	Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd014)
	c:RegisterEffect(e1)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local sa=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	if sa:FilterCount(Card.IsAttribute,nil,ATTRIBUTE_WIND)<=3 then
	local c=e:GetHandler()
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,c,1) end
end