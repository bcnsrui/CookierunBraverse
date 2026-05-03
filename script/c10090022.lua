if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
end
function s.otherfilter(c,tp)
	return Cookie3.NoEmFzonefilter(c,tp) and c:GetOverlayCount()>=1
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.otherfilter,tp,LOCATION_MZONE,0,1,e:GetHandler(),tp)
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.otherfilter,tp,LOCATION_MZONE,0,1,1,e:GetHandler(),tp)
	if #g>0 then Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,g,1) end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler())
end