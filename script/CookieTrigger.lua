--트리거는 실력이다
Cookie4={}

function Cookie4.szonecon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	return c:IsLocation(LOCATION_SZONE) and not c:IsLocation(LOCATION_FZONE)
end

--힐트리거쿠키
function Cookie4.HTCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c)
	Cookie2.battlemanacost(attr,colorCount,mixCount)(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb01)
	c:RegisterEffect(e1)
end
function Cookie4.healtriggerop(e,tp,eg,ep,ev,re,r,rp)
	local hg=e:GetLabelObject()
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)>0 then
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,0)) then
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
	local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
	Duel.SendtoGrave(g,REASON_RULE)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,hg,1) end end
end

--데미지트리거쿠키
function Cookie4.DMTCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c)
	Cookie2.battlemanacost(attr,colorCount,mixCount)(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb02)
	c:RegisterEffect(e1)
end
function Cookie4.damagetriggerop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)>0 then
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,0)) then
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
	local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
	Duel.SendtoGrave(g,REASON_RULE)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil)
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,ag,2) end end
end

--드로우트리거쿠키
function Cookie4.DRTCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c)
	Cookie2.battlemanacost(attr,colorCount,mixCount)(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb03)
	c:RegisterEffect(e1)
end
function Cookie4.drawtriggerop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,0)) then
	Duel.Draw(tp,1,REASON_RULE)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp) end
end

--얼그레이맛쿠키
function Cookie4.HT2CookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c)
	Cookie2.battlemanacost(attr,colorCount,mixCount)(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb04)
	c:RegisterEffect(e1)
end
function Cookie4.healtriggerop2(e,tp,eg,ep,ev,re,r,rp)
	local hg=e:GetLabelObject()
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)>0 then
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,0)) then
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
	local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	if ally<6 then return end	
	Duel.SendtoGrave(g,REASON_RULE)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,hg,2) end end
end