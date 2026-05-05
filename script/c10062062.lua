if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,2,2)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_DARK,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.myfilter(c,tp)
	return c:IsAttribute(ATTRIBUTE_DARK) and c:IsRace(RACE_WARRIOR)
	and c:IsLevelBelow(2) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.opfilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsLevelBelow(2) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	return Duel.GetMatchingGroupCount(s.myfilter,tp,LOCATION_MZONE,0,c,tp)>=1
	and not Duel.IsExistingMatchingCard(Card.IsSetCard,tp,0,LOCATION_MZONE,1,nil,0xd10)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local stage=Duel.GetMatchingGroup(Card.IsCode,tp,LOCATION_FZONE,0,nil,10070522)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=Duel.SelectMatchingCard(tp,s.myfilter,tp,LOCATION_MZONE,0,0,1,e:GetHandler(),tp)
	if #sg>0 then Duel.Remove(sg,POS_FACEUP,REASON_EFFECT)
	Duel.SendtoGrave(sg,REASON_EFFECT)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	starfruit=Duel.SelectMatchingCard(tp,s.opfilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if starfruit:GetFirst():IsSetCard(0xd18) then return end
	if #starfruit>0 then Duel.Remove(starfruit,POS_FACEUP,REASON_EFFECT)
	Duel.SendtoGrave(starfruit,REASON_EFFECT) end	end
	if #starfruit>0 and starfruit:GetFirst():IsSetCard(0xd09) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,starfruit) end
	if #sg>0 and sg:GetFirst():IsSetCard(0xd09) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,sg) end
	if #stage>0 and #starfruit>0 and stage:GetFirst():GetCounter(0x1000)==0 then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,stage) end
end