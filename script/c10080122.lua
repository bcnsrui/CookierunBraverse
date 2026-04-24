if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ALL_COLOR,5,5,0,0)
end
function s.Stagecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return e:GetHandler():IsAbleToGraveAsCost()
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.SendtoGrave(e:GetHandler(),REASON_COST)
end
function s.lv3filter(c)
	return c:IsRace(RACE_WARRIOR) and c:IsLevel(3)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.lv3filter,tp,LOCATION_GRAVE,0,0,1,nil)
	if #g==0 or Duel.GetLocationCount(tp,LOCATION_MZONE)<=0 then return end
	local tc=g:GetFirst()
	Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,tc)
	if tc:IsLocation(LOCATION_MZONE) and tc:IsControler(tp) then
		local count=Duel.AnnounceNumber(tp,5,4,3,2,1,0)
		if count==0 then return end
		Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count)
	end
end