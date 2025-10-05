--트리거는 실력이다
Cookie4={}

--힐트리거쿠키
function Cookie4.HTCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb01)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xb00)
	c:RegisterEffect(e2)
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
	Cookie2.CookieCharacter(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb02)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xb00)
	c:RegisterEffect(e2)
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
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,ag,1) end end
end

--드로우트리거쿠키
function Cookie4.DRTCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb03)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xb00)
	c:RegisterEffect(e2)
end
function Cookie4.drawtriggerop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,0)) then
	Duel.Draw(tp,1,REASON_RULE)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp) end
end

--얼그레이맛쿠키
function Cookie4.EGCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb04)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xb00)
	c:RegisterEffect(e2)
end
function Cookie4.Earlgreytriggerop(e,tp,eg,ep,ev,re,r,rp)
	local hg=e:GetLabelObject()
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)>0 then
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,0)) then
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
	local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
	Duel.SendtoGrave(g,REASON_RULE)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	if ally<6 then return end
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,hg,2) end end
end

--츄러스맛쿠키
function Cookie4.CHCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb05)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xb00)
	c:RegisterEffect(e2)
end
function Cookie4.Churrotriggerop(e,tp,eg,ep,ev,re,r,rp)
	local hg=e:GetLabelObject()
	local support=Duel.GetFieldGroupCount(tp,LOCATION_REMOVED,0)
	if support<4 then return end
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)>0 then
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,6)) then
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
	local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
	Duel.SendtoGrave(g,REASON_RULE)
	if not Duel.SelectYesNo(tp,aux.Stringid(10060001,0)) then return end
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	Duel.Overlay(ally,c) end end
end

--서리여왕쿠키
function Cookie4.FQCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb06)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xb00)
	c:RegisterEffect(e2)
end
function Cookie4.FrostQueentriggerop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	if ally<4 then return end
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,0)) then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,7))
	local ac=Duel.AnnounceNumber(tp,2,1,0)
	e:SetLabel(ac)
	if ac==2 then
	Duel.Draw(tp,1,REASON_EFFECT)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Draw(tp,1,REASON_EFFECT)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
	elseif ac==1 then
	Duel.Draw(tp,1,REASON_EFFECT)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
	else end end
end

--에일리언도넛
function Cookie4.TRCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb07)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xb00)
	c:RegisterEffect(e2)
end
function Cookie4.trashfilter(c)
	return c:IsLevelBelow(2) or c:IsLocation(LOCATION_FZONE)
end
function Cookie4.trashtriggerop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)==0 then return end
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,0)) then
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
	local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
	Duel.SendtoGrave(g,REASON_RULE)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	if ally<3 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie4.trashfilter,tp,0,LOCATION_ONFIELD,1,1,nil)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,g) end
end

--와일드베리맛 쿠키
function Cookie4.WBCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb08)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xb00)
	c:RegisterEffect(e2)
end
function Cookie4.wildberrytriggerop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10064102,0))
	local ac=Duel.AnnounceNumber(tp,3,2,1,0)
	if ac==0 then return end
	local decktop=Duel.GetDecktopGroup(tp,ac)
	Duel.SendtoGrave(decktop,REASON_EFFECT)
end

--미스틱오팔 쿠키
function Cookie4.MOCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb09)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xb00)
	c:RegisterEffect(e2)
end
function Cookie4.mystictriggerop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local g=Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)
	local decktop=Duel.GetDecktopGroup(tp,math.min(g,3))
	Duel.SendtoDeck(decktop,nil,SEQ_DECKTOP,REASON_EFFECT)
	if #decktop>1 then Duel.SortDecktop(tp,tp,#decktop) end
end

--젤리 개구리
function Cookie4.JLCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb10)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xb00)
	c:RegisterEffect(e2)
end
function Cookie4.jellyfrogtriggerop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	if ally<6 then return end
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,0)) then
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	Duel.Overlay(ally,c) end
end

--비신령쿠키
function Cookie4.BNCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb11)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xb00)
	c:RegisterEffect(e2)
end
function Cookie4.Raindeityfilter(c)
	return c:IsLevel(1) and c:IsRace(RACE_WARRIOR)
end
function Cookie4.Raindeitytriggerop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	if ally<5 then return end
	local tc=Duel.GetMatchingGroupCount(Cookie4.Raindeityfilter,tp,LOCATION_EXTRA,0,1,nil)
	if tc==0 then return end
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,0)) then
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOHAND)
	local g=Duel.SelectMatchingCard(tp,Cookie4.Raindeityfilter,tp,LOCATION_EXTRA,0,0,1,nil)
	Duel.SendtoHand(g,nil,REASON_EFFECT)
	Duel.ConfirmCards(1-tp,g)
	Duel.SendtoExtraP(c,nil,REASON_EFFECT) end
end

--스코빌리아 교장
function Cookie4.SCHCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb12)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xb00)
	c:RegisterEffect(e2)
end
function Cookie4.schtriggerop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
	if ally<6 then return end
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,0)) then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie4.schtriggerfilter,tp,0,LOCATION_MZONE,0,1,nil)
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,ag,1) end
end
function Cookie4.schtriggerfilter(c)
	return c:GetOverlayCount()>=2 and Cookie3.NoEmFzonefilter(c)
end

--아레나드로우 플립
function Cookie4.ARDRTCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb13)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xb00)
	c:RegisterEffect(e2)
end
function Cookie4.ARdrawtriggerop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local hg=e:GetLabelObject()
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)>5 then return end
	if not hg:IsSetCard(0xc01) then return end
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,0)) then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,7))
	local ac=Duel.AnnounceNumber(tp,2,1,0)
	e:SetLabel(ac)
	if ac==2 then
	Duel.Draw(tp,1,REASON_EFFECT)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Draw(tp,1,REASON_EFFECT)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
	elseif ac==1 then
	Duel.Draw(tp,1,REASON_EFFECT)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
	else end end
end

--아레나힐 플립
function Cookie4.ARHTCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb14)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xb00)
	c:RegisterEffect(e2)
end
function Cookie4.ARhealtriggerop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local hg=e:GetLabelObject()
	if hg:GetLevel()<2 then return end
	if not hg:IsSetCard(0xc01) then return end
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,0)) then
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,hg,1) end
end