if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_WIND,1,1)
end
function s.windancientfilter(c,tp)
	return (c:IsCode(table.unpack(CARD_WIND_ARCHER_COOKIE)) or c:IsSetCard(0xc04))
		and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,-1) end
	if Duel.IsExistingMatchingCard(s.windancientfilter,tp,LOCATION_MZONE,0,1,nil,tp)
	and Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ALL_COLOR,0,1)
	and Duel.SelectYesNo(tp,aux.Stringid(10060003,1)) then
		Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,0,1)
		local em=Duel.GetMatchingGroup(nil,1-tp,LOCATION_EMZONE,0,nil):GetFirst()
		if not em then return end
		local enemyactive=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,0,1,0)
		if #enemyactive==0 then return end
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local sg=enemyactive:Select(tp,0,1,nil)
		if #sg>0 then Duel.Overlay(em,sg) end
	end
end