if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)>=2
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local mana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=mana:Select(tp,2,2,nil)
	if #g>0 then Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,c)
	Duel.SendtoGrave(g,REASON_COST) end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local draw=Duel.AnnounceNumber(tp,2,1,0)
	if draw==0 then return end
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,draw)
end