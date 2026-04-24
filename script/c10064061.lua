if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,3,3)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd031)
	c:RegisterEffect(e1)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)>=7 then
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally:GetOverlayCount()==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=ally:GetOverlayGroup():Select(tp,0,1,nil)
	if #g>0 then Duel.Remove(g,POS_FACEUP,REASON_EFFECT) end end
end