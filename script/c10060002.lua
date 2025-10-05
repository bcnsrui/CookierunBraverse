local s,id=GetID()
function s.initial_effect(c)
	Cookie.MainCharacter(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_EMZONE)
	e1:SetOperation(s.shop)
	c:RegisterEffect(e1)
end
function s.shop(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetFieldGroup(tp,LOCATION_DECK,0)
	local tc=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_DECK,0,0,#g,nil)
	Duel.Remove(tc,POS_FACEUP,REASON_RULE)
end