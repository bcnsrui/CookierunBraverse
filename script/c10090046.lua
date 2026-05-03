if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_LIGHT,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd031)
	c:RegisterEffect(e1)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	return Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=6 and ally and ally:IsSetCard(0xa07)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,8)) then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if e:GetHandler():GetOverlayCount()<=3 then
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),1) end
end