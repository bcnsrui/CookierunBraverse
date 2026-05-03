if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_LIGHT,1,1)
end
function s.eqfilter(c,tp)
	return c:IsSetCard(0xc03) and c:GetEquipTarget()
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local lv=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	return lv>=4 and Duel.IsExistingMatchingCard(s.eqfilter,tp,0,LOCATION_SZONE,1,nil,tp)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local em=Duel.GetMatchingGroup(nil,1-tp,LOCATION_EMZONE,0,nil):GetFirst()
	if em:IsSetCard(0xa15) then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.eqfilter,tp,0,LOCATION_SZONE,1,1,nil,tp)
	local eq=g:GetFirst()
	if not eq then return end
	local tc=eq:GetEquipTarget()
	if not tc then return end
	Duel.DisableShuffleCheck()
	Duel.SendtoDeck(g,nil,SEQ_DECKTOP,REASON_RULE)
	Cookie7.faceuphpaddop(e,1-tp,eg,ep,ev,re,r,rp,1-tp,tc,1)
end