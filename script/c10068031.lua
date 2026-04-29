if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,2)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_LIGHT,1,1)
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_SINGLE)
	e0:SetCode(EFFECT_ADD_SETCODE)
	e0:SetValue(0xd011)
	c:RegisterEffect(e0)
end
function s.lv3filter(c)
	return c:IsLevel(3) and c:IsRace(RACE_WARRIOR)
end
function s.cookiefilter(c)
	return c:IsFaceup() and c:IsRace(RACE_WARRIOR)
end
function s.sum3check(sg,e,tp,mg)
	return sg:GetSum(Card.GetLevel)<=3
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.lv3filter,tp,LOCATION_GRAVE,0,1,nil)
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local sg=Duel.SelectMatchingCard(tp,s.lv3filter,tp,LOCATION_GRAVE,0,1,1,nil)
	if #sg>0 then Duel.SendtoExtraP(sg,nil,REASON_COST) end
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(s.cookiefilter,tp,LOCATION_EXTRA,0,nil)
	if #g<2 then return false end
	local lvs={}
	for tc in aux.Next(g) do table.insert(lvs,tc:GetLevel()) end
	for i=1,#lvs do
		for j=i+1,#lvs do
			if lvs[i]+lvs[j]<=3 then return true end
		end
	end
	return false
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.GetMatchingGroup(s.cookiefilter,tp,LOCATION_EXTRA,0,nil)
	local sg=aux.SelectUnselectGroup(g,e,tp,2,2,s.sum3check,1,tp,aux.Stringid(10060000,6))
	if #sg>0 then
		Duel.SendtoHand(sg,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,sg)
	end
	Duel.ShuffleHand(tp)
end