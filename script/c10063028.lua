if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,3,3)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_LIGHT,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
	local e2=e1:Clone()
	e2:SetValue(0xd031)
	c:RegisterEffect(e2)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)>0
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
	local g=Duel.SelectMatchingCard(tp,aux.TRUE,tp,LOCATION_HAND,0,1,1,nil)
	Duel.SendtoGrave(g,REASON_RULE)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local exg=Duel.GetMatchingGroup(Card.IsFaceup,tp,0,LOCATION_EXTRA,nil)
	if exg:GetSum(Card.GetLevel)>6 then return false end
	return Duel.IsExistingMatchingCard(s.lv1oppgrave,tp,0,LOCATION_GRAVE,1,nil)
end
function s.lv1oppgrave(c)
	return c:IsRace(RACE_WARRIOR) and c:GetLevel()==1
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.lv1oppgrave,tp,0,LOCATION_GRAVE,0,1,nil)
	if #g>0 then Duel.SendtoExtraP(g,nil,REASON_EFFECT) end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if e:GetHandler():GetOverlayCount()<=5 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),1) end
end
