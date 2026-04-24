local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,2,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WATER,1,1)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local dg=Duel.GetDecktopGroup(tp,1)
	local tc=dg:GetFirst()
	if not tc then return end
	Duel.ConfirmCards(1-tp,dg)
	if tc:IsRace(RACE_WARRIOR) and tc:IsAttribute(ATTRIBUTE_WATER) and tc:IsLevel(2) then
		local enemy=Duel.GetMatchingGroup(nil,tp,0,LOCATION_EMZONE,nil):GetFirst()
		local e1=Effect.CreateEffect(e:GetHandler())
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_ADD_SETCODE)
		e1:SetValue(0xa01)
		e1:SetReset(RESET_PHASE+PHASE_END)
		enemy:RegisterEffect(e1)
	end
end