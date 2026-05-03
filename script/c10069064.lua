if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,3,3)
	Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd024)
	c:RegisterEffect(e1)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)==0 then return end
	local mana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)
	Duel.Hint(HINT_SELECTMSG,1-tp,aux.Stringid(10060001,1))
	local g=mana:Select(1-tp,1,1,nil)
	if #g>0 then Duel.SendtoGrave(g,REASON_EFFECT) end
end