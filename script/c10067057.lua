if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,1,2)
	Cookie6.IGCoookieEffect(c,0,ATTRIBUTE_WIND,2,2)
end
function s.lv2arenafilter(c)
	return c:IsSetCard(0xc01) and c:IsRace(RACE_WARRIOR) and c:GetLevel()>=2
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	local g=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0):Filter(s.lv2arenafilter,nil)
	return #g>0
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0):Filter(s.lv2arenafilter,nil)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=g:Select(tp,1,1,nil)
	local c=e:GetHandler()
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally then
	local mg=c:GetOverlayGroup()
	if #mg>0 then Duel.SendtoGrave(mg,REASON_EFFECT) end
	Duel.Overlay(ally,c) end
	if #ag>0 then Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,ag) end
end