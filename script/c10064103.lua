if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd031)
	c:RegisterEffect(e1)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local count=Duel.AnnounceNumber(tp,3,2,1,0)
	if count==0 then return end
	Cookie3.CookieTrashop(e,tp,eg,ep,ev,re,r,rp,count)
end