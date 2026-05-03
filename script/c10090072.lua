if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WIND,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd031)
	c:RegisterEffect(e1)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)>=6
	and Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,0,1,0)>=1
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local enemy=Duel.GetMatchingGroup(Card.IsFaceup,tp,0,LOCATION_EMZONE,nil):GetFirst()
	local enemymana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,0,1,0)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=enemymana:Select(tp,1,1,nil)
	if #g>0 then Duel.Overlay(enemy,g) end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,0,1,0)==0 then
	local bc=e:GetHandler():GetBattleTarget()
	if bc then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,bc,1) end end
end