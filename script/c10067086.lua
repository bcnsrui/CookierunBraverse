if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WATER,1,1,0,0)
end
function s.handfilter(c)
	return c:IsAttribute(ATTRIBUTE_WATER) and c:IsSetCard(0xc01)
end
function s.Stagecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.handfilter,tp,LOCATION_HAND,0,1,nil)
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local hg=Duel.SelectMatchingCard(tp,s.handfilter,tp,LOCATION_HAND,0,1,1,nil)
	Duel.SendtoGrave(hg,REASON_RULE)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,8)) then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end
end