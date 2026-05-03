if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,3,3)
	Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd134)
	c:RegisterEffect(e1)
end
function s.flipyellow(c)
	return c:IsRace(RACE_WARRIOR) and c:IsSetCard(0xb00)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local can_hand=Duel.IsExistingMatchingCard(s.flipyellow,tp,LOCATION_HAND,0,1,nil)
	local can_hp=c:GetOverlayCount()>=1
	if not can_hand and not can_hp then return end
	if can_hand and can_hp then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
		local sel=Duel.SelectOption(tp,aux.Stringid(id,0),aux.Stringid(id,1))
		if sel==0 then
			Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DISCARD)
			local g=Duel.SelectMatchingCard(tp,s.flipyellow,tp,LOCATION_HAND,0,1,1,nil)
			if #g>0 then Duel.SendtoGrave(g,REASON_EFFECT+REASON_DISCARD) end
		else
			Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,c,1)
		end
	elseif can_hand then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DISCARD)
		local g=Duel.SelectMatchingCard(tp,s.flipyellow,tp,LOCATION_HAND,0,1,1,nil)
		if #g>0 then Duel.SendtoGrave(g,REASON_EFFECT+REASON_DISCARD) end
	else
		Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,c,1)
	end
end