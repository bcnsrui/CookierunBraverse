if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ALL_COLOR,0,5,0,5)
end
function s.lv2belowfilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsLevelBelow(2) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.lv3filter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsLevel(3) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(s.lv2belowfilter,tp,LOCATION_MZONE,LOCATION_MZONE,nil,tp)
	if #g>0 then
		Duel.DisableShuffleCheck()
		for tc in aux.Next(g) do
			Duel.SendtoDeck(tc,nil,SEQ_DECKBOTTOM,REASON_EFFECT)
		end
	end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=Duel.SelectMatchingCard(tp,s.lv3filter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #sg>0 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,sg,1) end
end