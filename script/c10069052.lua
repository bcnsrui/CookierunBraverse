if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetCondition(function(e)
		local tp=e:GetHandlerPlayer()
		return Cookie3.SupportAreaCount(e,tp,nil,nil,nil,nil,nil,nil,1,1,0,0)>=7
	end)
	e1:SetValue(1)
	c:RegisterEffect(e1)
end