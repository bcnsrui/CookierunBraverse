if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,1,1)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_FIRE,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
return Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,nil,tp)>=2
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,e:GetHandler(),tp)
	if #g>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,2) end
end