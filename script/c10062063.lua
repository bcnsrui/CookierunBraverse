if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,3,3)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb00)
	c:RegisterEffect(e1)
end
function s.FlipCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,0,ALL_COLOR,1,1)
end
function s.FlipCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,1,1)
end
function s.lv2orstagefilter(c,tp)
	return (c:IsRace(RACE_WARRIOR) and c:IsLevelBelow(2) and Cookie3.NoEmFzonefilter(c,tp))
	or c:IsLocation(LOCATION_FZONE)
end
function s.FlipCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	return ally>=3 and Duel.IsExistingMatchingCard(s.lv2orstagefilter,tp,0,LOCATION_ONFIELD,1,nil,tp)
end
function s.FlipCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.lv2orstagefilter,tp,0,LOCATION_ONFIELD,1,1,nil,tp)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,g)
end