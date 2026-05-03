if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
	Cookie6.IGCoookieEffect(c,0,ATTRIBUTE_WIND,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
end
function s.greencookie(c)
	return c:IsAttribute(ATTRIBUTE_WIND) and c:IsRace(RACE_WARRIOR)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0):FilterCount(s.greencookie,nil)>=1
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0):FilterSelect(tp,s.greencookie,0,1,nil)
	if #g>0 then Duel.SendtoHand(g,nil,REASON_EFFECT) end
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally then
		local mg=c:GetOverlayGroup()
		if #mg>0 then Duel.SendtoGrave(mg,REASON_EFFECT) end
		Duel.Overlay(ally,c)
	end
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ATTRIBUTE_WIND,2,2)
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WIND,2,2)
end
function s.AndCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)<=5
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local dt=Duel.GetDecktopGroup(tp,1)
	if #dt==0 then return end
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally then Duel.Overlay(ally,dt) end
end