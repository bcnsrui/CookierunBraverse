if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetCondition(s.condition)
	e1:SetValue(0xd18)
	c:RegisterEffect(e1)
end
function s.condition(e)
	local tp=e:GetHandlerPlayer()
	return Cookie3.SupportAreaCount(e,tp,nil,nil,nil,nil,nil,nil,1,1,0,0)<=4
end