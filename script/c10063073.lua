if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,1,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WATER,1,1)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local count=Duel.AnnounceNumber(tp,1,0)
	if count==0 then return end
	local deck=Duel.GetFieldGroup(tp,LOCATION_DECK,0)
	if #deck==0 then return end
	local bottom=deck:GetFirst()
	for tc in aux.Next(deck) do
		if tc:GetSequence()<bottom:GetSequence() then bottom=tc end
	end
	Duel.ConfirmCards(tp,bottom)
	if bottom:IsRace(RACE_WARRIOR) then
		Duel.SendtoDeck(bottom,nil,SEQ_DECKTOP,REASON_EFFECT)
	else
		Duel.SendtoHand(bottom,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,bottom)
	end
end