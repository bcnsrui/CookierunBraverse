if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,2,2)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_DARK,0,0)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xd09)
	c:RegisterEffect(e2)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	return c:IsLocation(LOCATION_GRAVE)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local ct=math.min(Duel.GetFieldGroupCount(tp,LOCATION_DECK,0),3)
	if ct==0 then return end
	local g=Duel.GetDecktopGroup(tp,ct)
	Duel.ConfirmCards(tp,g)
	local pg=g:FilterSelect(tp,Card.IsAttribute,0,1,nil,ATTRIBUTE_DARK)
	if #pg>0 then
		Duel.SendtoHand(pg,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,pg)
		Duel.ShuffleHand(tp)
		g:Sub(pg)
	end
	if #g>0 then Duel.SendtoGrave(g,REASON_EFFECT) end
end