if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_FIRE,1,1,1,1)
end
function s.lv2filter(c,tp)
	return c:GetLevel()>=2 and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp) and c:GetOverlayCount()>=1
end
function s.Stagecost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.lv2filter,tp,LOCATION_MZONE,0,1,nil,tp) end
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local ag=Duel.SelectMatchingCard(tp,s.lv2filter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,ag,1)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local ag=Duel.GetMatchingGroup(s.lv2filter,tp,LOCATION_MZONE,0,nil,tp)
	Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,ag,1)
	if Duel.IsExistingMatchingCard(Card.ListsCode,tp,LOCATION_MZONE,0,1,nil,CARD_PITAYA_DRAGON) 
	and Duel.SelectYesNo(tp,aux.Stringid(10060001,8)) then
		Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
	end
end