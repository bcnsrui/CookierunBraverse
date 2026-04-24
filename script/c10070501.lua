if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,3,3)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_DARK,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.lv1orstagefilter(c,tp)
	return (c:IsRace(RACE_WARRIOR) and c:IsLevel(1) and Cookie3.NoEmFzonefilter(c,tp)) or c:IsLocation(LOCATION_FZONE)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.lv1orstagefilter,tp,0,LOCATION_ONFIELD,nil,tp)>=1
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.lv1orstagefilter,tp,0,LOCATION_ONFIELD,1,1,nil,tp)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,g)
end