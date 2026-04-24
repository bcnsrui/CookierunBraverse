if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,1,1)
end
function s.hp3greenfilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsAttribute(ATTRIBUTE_WIND) and c:GetOverlayCount()<=3 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)>=5
		and Duel.IsExistingMatchingCard(s.hp3greenfilter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.hp3greenfilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #g>0 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,g,1) end
end