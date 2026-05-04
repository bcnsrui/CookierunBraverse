if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_DARK,1,1)
end
function s.lv1purplefilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsAttribute(ATTRIBUTE_DARK) and c:IsLevel(1) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Itemcost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.lv1purplefilter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.Itemcostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	littlestar=Duel.SelectMatchingCard(tp,s.lv1purplefilter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	Duel.Remove(littlestar,POS_FACEUP,REASON_EFFECT)
	Duel.SendtoGrave(littlestar,REASON_EFFECT)
end
function s.enemylv2filter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsLevelBelow(2) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.enemylv2filter,tp,0,LOCATION_MZONE,1,nil,tp)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local stage=Duel.GetMatchingGroup(Card.IsCode,tp,LOCATION_FZONE,0,nil,10070522)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=Duel.SelectMatchingCard(tp,s.enemylv2filter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #sg>0 then Duel.Remove(sg,POS_FACEUP,REASON_EFFECT)
	Duel.SendtoGrave(sg,REASON_EFFECT) end
	if #sg>0 and sg:GetFirst():IsSetCard(0xd09) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,sg) end
	if #littlestar>0 and littlestar:GetFirst():IsSetCard(0xd09) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,littlestar) end
	if #stage>0 and #sg>0 and stage:GetFirst():GetCounter(0x1000)==0 then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,stage) end
end