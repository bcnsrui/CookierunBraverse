if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_LIGHT,1,1,0,0)
end
function s.breakfilter(c)
	return c:IsFaceup() and c:IsRace(RACE_WARRIOR) and c:IsLevel(1) and c:IsAttribute(ATTRIBUTE_LIGHT)
end
function s.Stagecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.breakfilter,tp,LOCATION_EXTRA,0,1,nil)
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local bg=Duel.SelectMatchingCard(tp,s.breakfilter,tp,LOCATION_EXTRA,0,1,1,nil)
	Duel.SendtoHand(bg,nil,REASON_EFFECT)
	Duel.ConfirmCards(1-tp,bg)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	Duel.SendtoExtraP(ag,nil,REASON_EFFECT)
end