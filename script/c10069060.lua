if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,4,4)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WIND,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd031)
	c:RegisterEffect(e1)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)>=2
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	local mana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=mana:Select(tp,2,2,nil)
	if #g>0 then Duel.SendtoGrave(g,REASON_COST) end
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local restmana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,1,0,0)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=restmana:Select(tp,0,2,nil)
	if #sg>0 then Duel.Remove(sg,POS_FACEUP,REASON_EFFECT) end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)<6 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #ag>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,ag,1) end
end