if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_LIGHT,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,0,ALL_COLOR,1,1)
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,1,1)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local em=Duel.GetMatchingGroup(nil,1-tp,LOCATION_EMZONE,0,nil):GetFirst()
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xa16)
	e1:SetReset(RESET_PHASE+PHASE_END)
	em:RegisterEffect(e1)
	local e2=Effect.CreateEffect(e:GetHandler())
	e2:SetDescription(aux.Stringid(id,0))
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetProperty(EFFECT_FLAG_CLIENT_HINT+EFFECT_FLAG_CANNOT_DISABLE)
	e2:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
	em:RegisterEffect(e2)
end
function s.flipyellow(c)
	return c:IsRace(RACE_WARRIOR) and c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsSetCard(0xb00)
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.flipyellow,tp,LOCATION_HAND,0,1,nil)
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.flipyellow,tp,LOCATION_HAND,0,1,1,nil)
	if #g>0 then Duel.SendtoGrave(g,REASON_COST) end
end
function s.breakcookie(c)
	return c:IsFaceup() and c:IsRace(RACE_WARRIOR)
end
function s.AndCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.breakcookie,tp,LOCATION_EXTRA,0,nil)>=2
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1) end
end