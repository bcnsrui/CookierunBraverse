if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,2,2)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_WATER,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)>0
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetFieldGroup(tp,LOCATION_HAND,0)
	if #g>0 then Duel.SendtoGrave(g,REASON_RULE) end
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local count=Duel.AnnounceNumber(tp,4,3,2,1,0)
	if count==0 then return end
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count)
end