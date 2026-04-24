if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,3,3)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCondition(s.atkcon)
	e1:SetValue(3)
	c:RegisterEffect(e1)
end
function s.atkcon(e)
	local tp=e:GetHandlerPlayer()
	return Cookie3.SupportAreaCount(e,tp,nil,nil,nil,nil,nil,nil,1,1,0,0)<=5
end