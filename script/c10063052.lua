if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_WIND,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.otherlowhp(c,exc,tp)
	return c~=exc and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp) and c:GetOverlayCount()<=2
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)>=1
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	local supportarea=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=supportarea:Select(tp,1,1,nil)
	Duel.SendtoGrave(g,REASON_EFFECT)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.otherlowhp,tp,LOCATION_MZONE,0,1,nil,e:GetHandler(),tp)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local tc=Duel.SelectMatchingCard(tp,function(sc) return s.otherlowhp(sc,e:GetHandler(),tp) end,tp,LOCATION_MZONE,0,1,1,nil,tp):GetFirst()
	if tc then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,tc,1) end
end