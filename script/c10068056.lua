local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,3,3)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10061009,0))
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e1:SetCode(EVENT_ATTACK_ANNOUNCE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCondition(s.blockercookiecon)
	e1:SetOperation(s.blockercookieop)
	c:RegisterEffect(e1)
end
function s.blockercookiecon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local bt=Duel.GetAttackTarget()
	return c~=bt and bt:GetControler()==c:GetControler()
	and Duel.IsExistingMatchingCard(Card.IsAttribute,tp,LOCATION_REMOVED,0,1,nil,ATTRIBUTE_WIND)
end
function s.blockercookieop(e,tp,eg,ep,ev,re,r,rp)
	if Duel.SelectYesNo(tp,aux.Stringid(10061009,0)) then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,Card.IsAttribute,tp,LOCATION_REMOVED,0,1,1,nil,ATTRIBUTE_WIND)
	Duel.HintSelection(g)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	Duel.Overlay(ally,g)
	Duel.ChangeAttackTarget(e:GetHandler()) end
end