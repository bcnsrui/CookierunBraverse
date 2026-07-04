if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_LIGHT,0,0)
end
function s.wizardfilter(c,tp)
	return c:IsCode(table.unpack(CARD_WIZARD_COOKIE)) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.flipgravefilter(c)
	return c:IsRace(RACE_WARRIOR) and c:IsSetCard(0xb00)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.wizardfilter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectMatchingCard(tp,s.flipgravefilter,tp,LOCATION_GRAVE,0,0,1,nil)
	if #g>0 then
		Duel.SendtoHand(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
	end
end