if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,1,1)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_LIGHT,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.restlv2filter(c,tp)
	return c:IsDefensePos() and c:IsLevelBelow(2) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	return ally>=3 and Duel.IsExistingMatchingCard(s.restlv2filter,tp,0,LOCATION_MZONE,1,nil,tp)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.restlv2filter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,2) end
end