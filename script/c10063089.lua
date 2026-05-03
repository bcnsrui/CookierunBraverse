if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,3,3)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_WATER,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.othercookie(c,exc,tp)
	return c~=exc and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	return Duel.IsExistingMatchingCard(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil,tp)
		and Duel.IsExistingMatchingCard(s.othercookie,tp,LOCATION_MZONE,0,1,nil,c,tp)
		and c:GetOverlayCount()>=1
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local dg=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #dg==0 then return end
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,dg,1)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally:IsSetCard(0xa15) then return end
	if Duel.IsExistingMatchingCard(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,2,nil,tp) then
	local g=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,nil,tp)
	local cg=Group.FromCards(c)
	g:Sub(cg)
	Cookie7.hpdecktop(e,tp,eg,ep,ev,re,r,rp,cg,1)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,g,1) end
end