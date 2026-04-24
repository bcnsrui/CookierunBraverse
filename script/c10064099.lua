if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,1,1)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_DARK,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local ct=Duel.AnnounceNumber(tp,3,2,1,0)
	if ct==0 then return end
	if Duel.SelectYesNo(tp,aux.Stringid(id,1)) then
	Cookie3.CookieTrashop(e,1-tp,eg,ep,ev,re,r,rp,ct)
	else Cookie3.CookieTrashop(e,tp,eg,ep,ev,re,r,rp,ct) end
end