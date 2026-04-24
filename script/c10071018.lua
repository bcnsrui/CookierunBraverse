if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_DARK,3,3)
end
function s.purplelv3filter(c)
	return c:IsRace(RACE_WARRIOR) and c:IsAttribute(ATTRIBUTE_DARK) and c:IsLevel(3)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil,tp)
		and Duel.IsExistingMatchingCard(s.purplelv3filter,tp,LOCATION_GRAVE,0,1,nil)
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,1,nil,tp)
	if #g==0 then return end
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,-2)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local tg=Duel.SelectMatchingCard(tp,s.purplelv3filter,tp,LOCATION_GRAVE,0,0,1,nil)
	if #tg>0 then
		Duel.SendtoHand(tg,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,tg)
	end
end