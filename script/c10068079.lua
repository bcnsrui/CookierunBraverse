if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,2,2)
	Cookie6.IGCoookieEffect(c,0,ATTRIBUTE_WATER,0,0)
end
function s.bluefilter(c)
	return c:IsAttribute(ATTRIBUTE_WATER)
end
function s.enemylv1filter(c,tp)
	return c:IsLevel(1) and c:IsRace(RACE_WARRIOR) and not Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.GetMatchingGroupCount(s.bluefilter,tp,LOCATION_HAND,0,nil)>=2
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local hg=Duel.SelectMatchingCard(tp,s.bluefilter,tp,LOCATION_HAND,0,2,2,nil)
	Duel.SendtoGrave(hg,REASON_COST)
	Duel.SendtoDeck(e:GetHandler(),nil,SEQ_DECKBOTTOM,REASON_COST)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.enemylv1filter,tp,0,LOCATION_MZONE,1,nil,tp)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.enemylv1filter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #ag>0 then
	e1=Effect.CreateEffect(ag:GetFirst())
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xa10)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END+RESET_OPPO_TURN,1)
	ag:GetFirst():RegisterEffect(e1) end
end