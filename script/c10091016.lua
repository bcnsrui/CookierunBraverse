if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_FIRE,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_FIRE,0,0)
end
function s.redbattlefilter(c,tp)
	return c:IsAttribute(ATTRIBUTE_FIRE) and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.redcookiefilter(c,tp)
	return s.redbattlefilter(c,tp) and c:GetOverlayCount()>0
end
function s.redhpsum(tp)
	return Duel.GetMatchingGroup(s.redbattlefilter,tp,LOCATION_MZONE,0,nil,tp):GetSum(Card.GetOverlayCount)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return s.redhpsum(tp)~=1 and Duel.IsExistingMatchingCard(s.redcookiefilter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	for i=1,2 do
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
		local g=Duel.SelectMatchingCard(tp,s.redcookiefilter,tp,LOCATION_MZONE,0,1,1,nil,tp)
		if #g==0 then return end
		Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,g,1)
	end
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)
	if #g>0 then Cookie7.Alldamageeff(e,tp,eg,ep,ev,re,r,rp,g,1) end
end