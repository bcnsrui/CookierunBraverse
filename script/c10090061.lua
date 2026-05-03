if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WIND,0,0)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local myc=Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local opc=Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)
	return myc+1==opc
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,0,1,nil)
	if #g>0 then
		local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
		if ally then Duel.Overlay(ally,g) end
	end
end