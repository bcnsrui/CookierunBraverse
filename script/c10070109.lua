local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.CSCookieEffect(c,ATTRIBUTE_FIRE,3,3)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetCondition(s.fccondition)
	e1:SetValue(1)
	c:RegisterEffect(e1)
end
function s.fccondition(e)
	local tp=e:GetHandlerPlayer()
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	return ally>=6
end