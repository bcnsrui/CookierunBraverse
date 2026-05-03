if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,3,3)
	Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd014)
	c:RegisterEffect(e1)
end
function s.otherchess(c,tp)
	return c:IsCode(10069038) and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.IsExistingMatchingCard(s.otherchess,tp,LOCATION_MZONE,0,1,e:GetHandler(),tp) then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,nil,tp)
	Cookie7.Allhpaddop(e,tp,eg,ep,ev,re,r,rp,g,1) end
end