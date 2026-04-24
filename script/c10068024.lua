if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_FIRE,1,1,2,2)
end
function s.cookiefilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Stagecost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.cookiefilter,tp,LOCATION_MZONE,LOCATION_MZONE,1,nil,tp) end
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(s.cookiefilter,tp,LOCATION_MZONE,LOCATION_MZONE,nil,tp)
	if #g>0 then Cookie7.Alldamageeff(e,tp,eg,ep,ev,re,r,rp,g,1) end
end