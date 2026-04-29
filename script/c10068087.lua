if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,2,2)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_WATER,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.allybluelv1filter(c,tp,exc)
	return c:IsAttribute(ATTRIBUTE_WATER) and c:IsLevel(1) and c:IsRace(RACE_WARRIOR)
	and Cookie3.NoEmFzonefilter(c,tp) and c~=exc
end
function s.enemylv1filter(c,tp)
	return c:IsLevel(1) and c:IsRace(RACE_WARRIOR) and not Cookie3.NoEmFzonefilter(c,tp)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.allybluelv1filter,tp,LOCATION_MZONE,0,1,nil,tp,e:GetHandler())
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local ag=Duel.SelectMatchingCard(tp,s.allybluelv1filter,tp,LOCATION_MZONE,0,1,1,nil,tp,e:GetHandler())
	if #ag>0 then
		Duel.SendtoHand(ag,nil,REASON_COST)
		Duel.ConfirmCards(1-tp,ag)
		Duel.ShuffleHand(tp)
	end
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.enemylv1filter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #ag>0 then Duel.SendtoDeck(ag,nil,SEQ_DECKBOTTOM,REASON_EFFECT) end
end