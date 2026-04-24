if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,2,2)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_DARK,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
end
function s.myfilter(c,tp,hc)
	return c~=hc and c:IsAttribute(ATTRIBUTE_DARK) and c:IsRace(RACE_WARRIOR)
		and c:IsLevelBelow(2) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.opfilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsLevelBelow(2) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	return Duel.GetMatchingGroupCount(s.myfilter,tp,LOCATION_MZONE,0,nil,tp,c)>=1
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=Duel.SelectMatchingCard(tp,s.myfilter,tp,LOCATION_MZONE,0,0,1,nil,tp,c)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,sg)
	if #sg>0 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local og=Duel.SelectMatchingCard(tp,s.opfilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
		Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,og)
	end
end