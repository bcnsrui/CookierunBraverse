if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,3,3)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetRange(LOCATION_MZONE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetCondition(s.atkcon)
	e1:SetValue(1)
	c:RegisterEffect(e1)
end
function s.atkcon(e)
	local tp=e:GetHandlerPlayer()
	return Duel.GetTurnPlayer()==tp and Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)>=6
end