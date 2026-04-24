local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_LIGHT,1,1)
end
function s.lv3filter(c)
	return c:IsLevel(3) and c:IsRace(RACE_WARRIOR)
end
function s.yellowlv3filter(c)
	return c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsLevel(3) and c:IsRace(RACE_WARRIOR)
end
function s.Itemcost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.GetMatchingGroupCount(s.lv3filter,tp,LOCATION_HAND,0,nil)>=1
end
function s.Itemcostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.lv3filter,tp,LOCATION_HAND,0,1,1,nil)
	local tc=g:GetFirst()
	Duel.ConfirmCards(1-tp,tc)
	Duel.ShuffleHand(tp)
	e:SetLabelObject(tc)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
	and Duel.GetMatchingGroupCount(s.yellowlv3filter,tp,LOCATION_EXTRA,0,nil)>=1
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.yellowlv3filter,tp,LOCATION_EXTRA,0,0,1,nil)
	if #g>0 then
	Duel.SendtoGrave(g,REASON_EFFECT)
	Duel.SpecialSummon(g,0,tp,tp,false,false,POS_FACEUP_ATTACK) end
	local rc=e:GetLabelObject()
	if rc then Duel.SendtoExtraP(rc,nil,REASON_EFFECT) end
end