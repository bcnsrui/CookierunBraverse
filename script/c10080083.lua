if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,1,2)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_WIND,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd022)
	c:RegisterEffect(e1)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	return c:IsLocation(LOCATION_EXTRA) and c:IsAbleToGraveAsCost()
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.SendtoGrave(e:GetHandler(),REASON_COST)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)>=7
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local enemy=Duel.GetMatchingGroup(nil,tp,0,LOCATION_EMZONE,nil):GetFirst()
	local g=Duel.GetFieldGroup(1-tp,LOCATION_REMOVED,0)
	if not enemy or #g==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=g:Select(tp,0,1,nil)
	if #sg>0 then Duel.Overlay(enemy,sg) end
end