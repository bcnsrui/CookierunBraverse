if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,5,5)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_WIND,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xd031)
	c:RegisterEffect(e2)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local em=Duel.GetMatchingGroup(nil,1-tp,LOCATION_EMZONE,0,nil)
	if #em==0 then return false end
	local enemyactivemana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,0,1,0)
	return #enemyactivemana>0
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local em=Duel.GetMatchingGroup(nil,1-tp,LOCATION_EMZONE,0,nil):GetFirst()
	if not em then return end
	local enemyactivemana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,0,1,0)
	if #enemyactivemana==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=enemyactivemana:Select(tp,0,1,nil)
	if #ag>0 then Duel.Overlay(em,ag) end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	for i=1,2 do
		if c:GetOverlayCount()==0 then break end
		local og=c:GetOverlayGroup()
		local last=og:GetFirst()
		for tc in aux.Next(og) do
			if tc:GetSequence()>last:GetSequence() then last=tc end
		end
		Duel.SendtoGrave(last,REASON_EFFECT)
	end
	if c:GetOverlayCount()==0 and c:IsLocation(LOCATION_MZONE) then
		local supportarea=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
		if #supportarea>=2 then
			Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
			local g=supportarea:Select(tp,2,2,nil)
			for tc in aux.Next(g) do
				Duel.Remove(tc,POS_FACEUP,REASON_EFFECT)
			end
		end
		Cookie3.Cookiedestroyop(e,tp,eg,ep,ev,re,r,rp,c)
	end
end