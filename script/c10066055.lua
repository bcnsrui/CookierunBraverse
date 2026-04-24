local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,3)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCondition(s.nodmgcon)
	e1:SetValue(0xd06)
	c:RegisterEffect(e1)
end
function s.nodmgcon(e)
	local tp=e:GetHandlerPlayer()
	if Duel.GetTurnPlayer()~=tp then return false end
	local ally=Cookie3.SupportAreaCount(e,tp,nil,nil,nil,nil,nil,nil,1,1,0,0)
	local enemy=Cookie3.SupportAreaCount(e,tp,nil,nil,nil,nil,nil,nil,0,0,1,1)
	return ally<enemy
end