if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,1,2)
	Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd134)
	c:RegisterEffect(e1)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local sa=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	return Duel.GetTurnPlayer()==tp and sa:FilterCount(Card.IsAttribute,nil,ATTRIBUTE_WIND)>=7
		and ally and ally:GetOverlayCount()>0
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local sa=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if sa:FilterCount(Card.IsAttribute,nil,ATTRIBUTE_WIND)>=7 then
	local restsa=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,1,0,0)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=restsa:Select(tp,0,1,nil)
	if #g>0 then Duel.Remove(g,POS_FACEUP,REASON_EFFECT) end end
end