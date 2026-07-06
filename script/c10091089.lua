if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,3,3)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_DARK,0,0)
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
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.CookieTrashop(e,tp,eg,ep,ev,re,r,rp,3)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local count=Duel.AnnounceNumber(tp,2,1,0)
	if count>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count) end
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)>0 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
		local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
		if #g>0 then Duel.SendtoGrave(g,REASON_COST) end
	end
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally and ally:IsSetCard(0xa17) then
		Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),1)
	end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally and ally:IsSetCard(0xa17) then
	local g=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)
	if #g>0 then Cookie7.Alldamageeff(e,tp,eg,ep,ev,re,r,rp,g,1) end end
end