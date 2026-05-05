if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,1,1)
	Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd014)
	c:RegisterEffect(e1)
end
function s.yother(c,se,tp)
	return c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp) and c~=se
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.IsExistingMatchingCard(Card.IsSetCard,tp,0,LOCATION_MZONE,1,nil,0xd10) then return end
	local c=e:GetHandler()
	if Duel.IsExistingMatchingCard(s.yother,tp,LOCATION_MZONE,0,1,nil,c,tp) then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local tc=Duel.SelectMatchingCard(tp,s.yother,tp,LOCATION_MZONE,0,1,1,nil,c,tp):GetFirst()
	if tc then Duel.SendtoExtraP(tc,nil,REASON_EFFECT) end
	local ct=Duel.AnnounceNumber(tp,2,1,0)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,ct) end
end