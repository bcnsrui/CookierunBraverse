--쿠키런 브레이버스의 공통적인 임플란트2
Cookie7={}

--쿠키 체력 채우기
function Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,hg,hp)
	local heal=0
	while heal<hp do
	local c=e:GetHandler()
	local decktop=Duel.GetDecktopGroup(tp,1)
	local hpcode=decktop:GetFirst():GetOriginalCode()
	Duel.DisableShuffleCheck()
	Duel.SendtoDeck(decktop,nil,-2,REASON_RULE)
	local hpcookie=Duel.CreateToken(tp,10060001)
	Duel.Remove(hpcookie,POS_FACEUP,REASON_RULE)
	Duel.Overlay(hg,hpcookie)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e1:SetCode(EVENT_TO_GRAVE)
	e1:SetOperation(Cookie7.hpcookietograve)
	e1:SetLabel(hpcode)
	hpcookie:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e2:SetCode(EVENT_MOVE)
	e2:SetCondition(Cookie4.szonecon)
	e2:SetOperation(Cookie7.hpcookietomove)
	e2:SetLabel(hpcode)
	e2:SetLabelObject(hg)
	hpcookie:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e3:SetCode(EVENT_REMOVE)
	e3:SetOperation(Cookie7.hpcookietoremove)
	e3:SetLabel(hpcode)
	hpcookie:RegisterEffect(e3)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
	heal=heal+1 end
end
function Cookie7.hpcookietograve(e,tp,eg,ep,ev,re,r,rp)
	local hpcode=Duel.CreateToken(tp,e:GetLabel())
	Duel.DisableShuffleCheck()
	Duel.SendtoDeck(e:GetHandler(),nil,-2,REASON_RULE)
	Duel.SendtoGrave(hpcode,REASON_RULE)
end
function Cookie7.hpcookietoremove(e,tp,eg,ep,ev,re,r,rp)
	local hpcode=Duel.CreateToken(tp,e:GetLabel())
	Duel.DisableShuffleCheck()
	Duel.SendtoDeck(e:GetHandler(),nil,-2,REASON_RULE)
	Duel.Remove(hpcode,POS_FACEUP,REASON_RULE)
end
function Cookie7.hpcookietomove(e,tp,eg,ep,ev,re,r,rp)
	local hpcookie2=Duel.CreateToken(tp,e:GetLabel())
	Duel.DisableShuffleCheck()
	Duel.SendtoDeck(e:GetHandler(),nil,-2,REASON_RULE)
	Duel.MoveToField(hpcookie2,tp,tp,LOCATION_SZONE,POS_FACEUP,true)
	--힐트리거
	if hpcookie2:IsSetCard(0xb01) then
	Cookie4.healtriggerop(e,tp,eg,ep,ev,re,r,rp)
	--데미지트리거
	elseif hpcookie2:IsSetCard(0xb02) then
	Cookie4.damagetriggerop(e,tp,eg,ep,ev,re,r,rp)
	--드로우트리거
	elseif hpcookie2:IsSetCard(0xb03) then
	Cookie4.drawtriggerop(e,tp,eg,ep,ev,re,r,rp)
	--얼그레이맛
	elseif hpcookie2:IsSetCard(0xb04) then
	Cookie4.healtriggerop2(e,tp,eg,ep,ev,re,r,rp)
	--츄러스맛
	elseif hpcookie2:IsSetCard(0xb05) then
	Cookie4.supporttriggerop(e,tp,eg,ep,ev,re,r,rp)
	--서리여왕쿠키
	elseif hpcookie2:IsSetCard(0xb06) then
	Cookie4.drawtriggerop2(e,tp,eg,ep,ev,re,r,rp)
	--에일리언도넛
	elseif hpcookie2:IsSetCard(0xb07) then
	Cookie4.trashtriggerop(e,tp,eg,ep,ev,re,r,rp)
	--노트리거
	else end
	Duel.Remove(hpcookie2,POS_FACEUP,REASON_RULE)
	Duel.SendtoGrave(hpcookie2,REASON_RULE|REASON_RETURN)
end

--쿠키 데미지 주기
function Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,ag,dam)
	local c=e:GetHandler()
	local typ=type(ag)
	if typ=="Card" and ag==nil then return
	elseif typ=="Group" and #ag==0 then return end
	local tg
	if typ=="Card" then tg=ag
	elseif typ=="Group" then tg=ag:GetFirst() end
	if tg:IsSetCard(0xa06) and not tg:GetBattleTarget() then dam=0 end
	Duel.Damage(1-tp,dam,REASON_EFFECT)
	local damage=0
	while damage<dam and ((tg:GetOverlayCount()>0 and not tg:IsSetCard(0xa04)) or tg:GetOverlayCount()>1) do
	g=tg:GetOverlayGroup()
	last=g:GetFirst()
	tc=g:GetNext()
	for tc in aux.Next(g) do
		if tc:GetSequence()>last:GetSequence() then last=tc end
	end
	if tg:IsSetCard(0xa03) then Duel.SendtoGrave(last,REASON_EFFECT) else
	Duel.MoveToField(last,1-tp,1-tp,LOCATION_SZONE,POS_FACEUP,true) end
	damage=damage+1 end
	if dam>0 and tg:IsSetCard(0xa02) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,tg)
	Duel.RaiseEvent(e:GetHandler(),EVENT_CUSTOM+10060100,e,0,tp,tp,0) end
	if tg:GetOverlayCount()==0 and tg:IsLocation(LOCATION_MZONE) then Duel.Destroy(tg,REASON_RULE)
	if tg:IsSetCard(0xc03) and not c:IsSetCard(0xa01) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,tg) end end
end

--쿠키 데미지 주기(2장)
function Cookie7.doubledamageeff(e,tp,eg,ep,ev,re,r,rp,g,dam1,dam2)
	local setsg=Group.CreateGroup()
	if #g==0 then return end
	if #g==1 then
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,dam1)
	if g:GetFirst():IsLocation(LOCATION_EXTRA) then setsg:Merge(g) end
	local filtersg=setsg:Filter(Card.IsSetCard,nil,0xc03)
	Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,filtersg)
	else
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,3))
	local ag=g:FilterSelect(tp,aux.TRUE,1,1,nil)
	local bg=g:RemoveCard(ag)
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,ag,dam1)
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,bg,dam2)
	if ag:GetFirst():IsLocation(LOCATION_EXTRA) then setsg:Merge(ag) end
	if bg:GetFirst():IsLocation(LOCATION_EXTRA) then setsg:Merge(bg) end	
	local filtersg=setsg:Filter(Card.IsSetCard,nil,0xc03)
	Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,filtersg) end
end

--쿠키 hp 트래시로 보내기
function Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,ag,dam)
	local c=e:GetHandler()
	local typ=type(ag)
	if typ=="Card" and ag==nil then return
	elseif typ=="Group" and #ag==0 then return end
	local tg
	if typ=="Card" then tg=ag
	elseif typ=="Group" then tg=ag:GetFirst() end
	if tg:IsSetCard(0xa06) and not tg:GetBattleTarget() then dam=0 end
	Duel.Damage(1-tp,dam,REASON_EFFECT)
	local trash=0
	while trash<dam and (tg:GetOverlayCount()>0 or (tg:IsSetCard(0xa04) and tg:GetOverlayCount()>1)) do
	g=tg:GetOverlayGroup()
	last=g:GetFirst()
	tc=g:GetNext()
	for tc in aux.Next(g) do
		if tc:GetSequence()>last:GetSequence() then last=tc end
	end
	Duel.SendtoGrave(last,REASON_EFFECT)
	trash=trash+1 end
	if dam>0 and tg:IsSetCard(0xa02) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,tg)
	Duel.RaiseEvent(e:GetHandler(),EVENT_CUSTOM+10060100,e,0,tp,tp,0) end
	if tg:GetOverlayCount()==0 and tg:IsLocation(LOCATION_MZONE) then Duel.Destroy(tg,REASON_RULE)
	if tg:IsSetCard(0xc03) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,tg) end end
end

--쿠키 hp 서포트 에리어로 보내기POS_FACEUP
function Cookie7.hpsupporteff(e,tp,eg,ep,ev,re,r,rp,ag,dam,pos)
	local c=e:GetHandler()
	local typ=type(ag)
	if typ=="Card" and ag==nil then return
	elseif typ=="Group" and #ag==0 then return end
	local tg
	if typ=="Card" then tg=ag
	elseif typ=="Group" then tg=ag:GetFirst() end
	local hpsupport=0
	while hpsupport<dam and (tg:GetOverlayCount()>0 or (tg:IsSetCard(0xa04) and tg:GetOverlayCount()>1)) do
	g=tg:GetOverlayGroup()
	last=g:GetFirst()
	tc=g:GetNext()
	for tc in aux.Next(g) do
		if tc:GetSequence()>last:GetSequence() then last=tc end
	end
	Duel.Remove(last,pos,REASON_RULE)
	hpsupport=hpsupport+1 end
	if tg:GetOverlayCount()==0 and tg:IsLocation(LOCATION_MZONE) then Duel.Destroy(tg,REASON_RULE)
	if tg:IsSetCard(0xc03) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,tg) end end
end

--공격대미지 변화
function Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,reset1,reset2,g,atk)
	local typ=type(g)
	if typ=="Card" then
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetValue(atk)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+reset1,reset2)
	g:RegisterEffect(e1)

	elseif typ=="Group" then
	for tc in g:Iter() do
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetValue(atk)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+reset1,reset2)
	tc:RegisterEffect(e1) end end
end