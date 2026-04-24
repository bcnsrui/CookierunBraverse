if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_FIRE,1,1)
end
function s.cookiefilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:GetOverlayCount()>0 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Itemcost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.cookiefilter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.Itemcostoperation(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.SelectMatchingCard(tp,s.cookiefilter,tp,LOCATION_MZONE,0,1,1,nil,tp):GetFirst()
	Cookie7.hpdecktop(e,tp,eg,ep,ev,re,r,rp,tc,1)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local enemy=Duel.GetMatchingGroup(Card.IsFaceup,tp,0,LOCATION_EXTRA,nil)
	return #enemy<=1
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,0,1,0)
	if #g==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=g:Select(tp,0,2,nil)
	if #sg>0 then
	local enemy=Duel.GetMatchingGroup(nil,tp,0,LOCATION_EMZONE,nil):GetFirst()
	Duel.Overlay(enemy,sg) end
end