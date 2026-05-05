if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb00)
	c:RegisterEffect(e1)
end
function s.Raindeityfilter(c)
	return c:IsFaceup() and c:IsLevel(1) and c:IsRace(RACE_WARRIOR)
end
function s.FlipCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	return ally>=5 and Duel.IsExistingMatchingCard(s.Raindeityfilter,tp,LOCATION_EXTRA,0,1,nil)
	and not Duel.IsExistingMatchingCard(Card.IsSetCard,tp,0,LOCATION_MZONE,1,nil,0xd10)
end
function s.FlipCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local hg=Duel.SelectMatchingCard(tp,s.Raindeityfilter,tp,LOCATION_EXTRA,0,0,1,nil)
	Duel.SendtoHand(hg,nil,REASON_EFFECT)
	Duel.ConfirmCards(1-tp,hg)
	local g=Duel.GetMatchingGroup(Card.IsCode,tp,LOCATION_SZONE,0,nil,10064031)
	if #g>0 then 
	local e1=Effect.CreateEffect(g:GetFirst())
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xa16)
	e1:SetReset(RESET_PHASE+PHASE_END)
	g:GetFirst():RegisterEffect(e1)
	Duel.SendtoExtraP(g:GetFirst(),nil,REASON_EFFECT) end
end