if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_DARK,1,1,1,1)
end
function s.refreshchk(tp)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	return ally and ally:IsSetCard(0xa17)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.CookieTrashop(e,tp,eg,ep,ev,re,r,rp,3)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally and ally:IsSetCard(0xa17) and Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ATTRIBUTE_DARK,1,1)
	and Duel.SelectYesNo(tp,aux.Stringid(10060003,1)) then
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_DARK,1,1)
	Duel.SendtoGrave(e:GetHandler(),REASON_EFFECT)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1) end end
end