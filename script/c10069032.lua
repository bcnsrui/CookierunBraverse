if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb00)
	c:RegisterEffect(e1)
end
function s.defcookie(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsDefensePos() and Cookie3.NoEmFzonefilter(c,tp)
end
function s.FlipCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local draw=Duel.AnnounceNumber(tp,1,0)
	if draw>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,draw) end
	if Duel.GetTurnPlayer()==tp then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.defcookie,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #g>0 then Duel.ChangePosition(g,POS_FACEUP_ATTACK) end end
end