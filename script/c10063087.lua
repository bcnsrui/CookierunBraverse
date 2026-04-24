if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WATER,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd031)
	c:RegisterEffect(e1)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local top=Duel.GetDecktopGroup(tp,1)
	Duel.ConfirmCards(tp,top)
	local tc=top:GetFirst()
	if tc and tc:IsAttribute(ATTRIBUTE_WATER) and tc:IsRace(RACE_WARRIOR) and tc:IsLevel(2) then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
		Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1)
	end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local support=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local bc=e:GetHandler():GetBattleTarget()
	if support:IsExists(Card.IsSetCard,1,nil,0xc03) and bc and bc:IsLevel(1) then
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,bc,1) end
end