if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,3,3)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_DARK,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xd031)
	c:RegisterEffect(e2)
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.CookieTrashop(e,tp,eg,ep,ev,re,r,rp,5)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.CookieTrashop(e,1-tp,eg,ep,ev,re,r,rp,5)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.CookieTrashop(e,tp,eg,ep,ev,re,r,rp,3)
	Cookie3.CookieTrashop(e,1-tp,eg,ep,ev,re,r,rp,3)
end