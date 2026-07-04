if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WIND,1,1,2,2)
end
function s.greencookiefilter(c,tp)
	return c:IsAttribute(ATTRIBUTE_WIND) and c:IsRace(RACE_WARRIOR) and c:IsDefensePos() and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.greencookiefilter,tp,LOCATION_MZONE,0,0,2,nil,tp)
	if #g>0 then Duel.ChangePosition(g,POS_FACEUP_ATTACK) end
end