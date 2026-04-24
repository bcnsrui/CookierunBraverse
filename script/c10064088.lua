if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WATER,2,2,1,1)
end
function s.filter(c,tp)
	return c:IsAttribute(ATTRIBUTE_WATER) and c:GetLevel()<=2 and c:IsRace(RACE_WARRIOR) 
	and Cookie3.NoEmFzonefilter(c,tp) and c:GetOverlayCount()>=4
end
function s.Stagecost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,chk,ALL_COLOR,1,1) end
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,1,1)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.filter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #ag>0 then
		local tc=ag:GetFirst()
		Duel.SendtoHand(tc,tp,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,tc)
		Duel.ShuffleHand(tp)
	end
end
