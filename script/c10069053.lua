if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_SINGLE)
	e0:SetCode(EFFECT_ADD_SETCODE)
	e0:SetValue(0xb00)
	c:RegisterEffect(e0)
end
function s.greenhand(c)
	return c:IsAttribute(ATTRIBUTE_WIND)
end
function s.FlipCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local pool=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local maxct=math.min(3,#pool)
	if maxct==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=pool:Select(tp,0,maxct,nil)
	if #g==0 then return end
	Duel.SendtoHand(g,nil,REASON_EFFECT)
	Duel.ConfirmCards(1-tp,g)
	Duel.ShuffleHand(tp)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if not ally then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local hg=Duel.SelectMatchingCard(tp,s.greenhand,tp,LOCATION_HAND,0,#g,#g,nil)
	if #hg>0 then Duel.Overlay(ally,hg) end
end