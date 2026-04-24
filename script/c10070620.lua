if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_FIRE,2,2,0,0)
end
function s.costfilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:GetOverlayCount()>=1 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Stagecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.costfilter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.costfilter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	if #g>0 then Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,g,1) end
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local count=Duel.AnnounceNumber(tp,1,0)
	if count==1 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end
end