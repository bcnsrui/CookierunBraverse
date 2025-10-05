local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.CSCookieEffect(c,ATTRIBUTE_FIRE,2,2)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetCondition(s.fccondition)
	e1:SetValue(1)
	c:RegisterEffect(e1)
end
function s.fccondition(e)
	local tp=e:GetHandlerPlayer()
	return Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<4
end