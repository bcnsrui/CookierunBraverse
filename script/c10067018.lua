if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,3,4)
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_SINGLE)
	e0:SetCode(EFFECT_ADD_SETCODE)
	e0:SetValue(0xd031)
	c:RegisterEffect(e0)
end
function s.other_arena(c,hc)
	return c:IsSetCard(0xc01) and c:IsRace(RACE_WARRIOR) and c:IsFaceup() and c~=hc
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetMatchingGroupCount(s.other_arena,tp,LOCATION_MZONE,0,e:GetHandler())>=1 then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1) end end
end