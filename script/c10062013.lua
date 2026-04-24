if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_LIGHT,2,2)
end
function s.cookiefilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.lv1cookiefilter(c)
	return c:IsLevel(1) and c:IsRace(RACE_WARRIOR)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.cookiefilter,tp,LOCATION_MZONE,0,nil,tp)>=1
		and Duel.GetMatchingGroupCount(s.lv1cookiefilter,tp,LOCATION_EXTRA,0,nil)>=1
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g1=Duel.SelectMatchingCard(tp,s.cookiefilter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	Duel.SendtoExtraP(g1,nil,REASON_EFFECT)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g2=Duel.SelectMatchingCard(tp,s.lv1cookiefilter,tp,LOCATION_EXTRA,0,0,1,nil)
	Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,g2)
end