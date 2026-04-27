if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,1,2)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_WIND,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)>0
		and Duel.IsExistingMatchingCard(Card.IsFaceup,tp,LOCATION_EMZONE,0,1,nil)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local dg=Duel.GetDecktopGroup(tp,1)
	Duel.Remove(dg,POS_FACEUP,REASON_EFFECT)
end