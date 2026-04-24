if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
end
function s.supportcookiefilter(c)
	return c:IsRace(RACE_WARRIOR)
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	local mana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	return mana:IsExists(s.supportcookiefilter,1,nil)
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	local mana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local g=mana:Filter(s.supportcookiefilter,nil)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=g:Select(tp,1,1,nil)
	if #sg>0 then Duel.SendtoHand(sg,nil,REASON_COST)
	Duel.ConfirmCards(1-tp,sg) end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local bc=e:GetHandler():GetBattleTarget()
	if bc then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,bc,2) end
end