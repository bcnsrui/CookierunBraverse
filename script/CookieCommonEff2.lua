--쿠키런 브레이버스의 공통적인 임플란트2
Cookie7={}
Cookie7.FACEUP_MOVE_FLAG=10060091

function Cookie7.szonecon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	return c:IsLocation(LOCATION_SZONE) and not c:IsLocation(LOCATION_FZONE)
end
--HP 회복/오버레이 대상: 장착(각성)으로 SZONE에 붙어 있으면 장착 받는 쿠키로 보냄
function Cookie7.hp_heal_redirect(hg)
	if not hg then return nil end
	if hg:IsLocation(LOCATION_SZONE) and hg:GetEquipTarget() then
	return hg:GetEquipTarget() end
	return hg
end
--쿠키 체력 채우기
function Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,g,hp)
	local c=e:GetHandler()
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xa07)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
	ally:RegisterEffect(e1)
	if ally:IsSetCard(0xa15) then return end
	local typ=type(g)
	if typ=="Card" and g==nil then return
	elseif typ=="Group" and #g==0 then return end
	local hg
	if typ=="Card" then hg=g
	elseif typ=="Group" then hg=g:GetFirst() end
	hg=Cookie7.hp_heal_redirect(hg)
	if not hg then return end
	local heal=0
	while heal<hp do
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
	e2:SetCondition(Cookie7.szonecon)
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
	local e4=Effect.CreateEffect(c)
	e4:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e4:SetCode(EVENT_TO_DECK)
	e4:SetOperation(Cookie7.hpcookietodeck)
	e4:SetLabel(hpcode)
	hpcookie:RegisterEffect(e4)
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
function Cookie7.hpcookietodeck(e,tp,eg,ep,ev,re,r,rp)
	local hpcode=Duel.CreateToken(tp,e:GetLabel())
	Duel.DisableShuffleCheck()
	Duel.SendtoDeck(e:GetHandler(),nil,-2,REASON_RULE)
	Duel.SendtoDeck(hpcode,nil,SEQ_DECKTOP,REASON_RULE)
end
function Cookie7.hpcookietomove(e,tp,eg,ep,ev,re,r,rp)
	local hg=e:GetLabelObject()
	if not hg then return end
	local hpcookie2=Duel.CreateToken(tp,e:GetLabel())
	Duel.DisableShuffleCheck()
	Duel.SendtoDeck(e:GetHandler(),nil,-2,REASON_RULE)
	Duel.MoveToField(hpcookie2,tp,tp,LOCATION_SZONE,POS_FACEUP,true)
	if hpcookie2:IsSetCard(0xb00) then
	local code=hpcookie2:GetCode()
	local gtbl=_G["c" .. code]
	local cost1=true
	if gtbl and type(gtbl.FlipCookiecost) == "function" then
		cost1=gtbl.FlipCookiecost(e,tp,eg,ep,ev,re,r,rp) end
	if not cost1 then
	Duel.Remove(hpcookie2,POS_FACEUP,REASON_RULE)
	Duel.SendtoGrave(hpcookie2,REASON_RULE|REASON_RETURN) return end
	local condition1=true
	local costop1=function(e,tp,eg,ep,ev,re,r,rp) return end
	local operation1=function(e,tp,eg,ep,ev,re,r,rp) return end
	if gtbl and type(gtbl.FlipCookieeffcondition) == "function" then
		condition1=gtbl.FlipCookieeffcondition(e,tp,eg,ep,ev,re,r,rp) end
	if not Duel.SelectYesNo(tp,aux.Stringid(10060001,0)) then
	Duel.Remove(hpcookie2,POS_FACEUP,REASON_RULE)
	Duel.SendtoGrave(hpcookie2,REASON_RULE|REASON_RETURN) return end
	if condition1 then
	if gtbl and type(gtbl.FlipCookiecostoperation) == "function" then
		costop1=gtbl.FlipCookiecostoperation(e,tp,eg,ep,ev,re,r,rp) end
	if gtbl and type(gtbl.FlipCookieoperation) == "function" then
		operation1=gtbl.FlipCookieoperation(e,tp,eg,ep,ev,re,r,rp) end
	elseif not condition1 and Duel.SelectYesNo(tp,aux.Stringid(10060001,10)) then
	if gtbl and type(gtbl.FlipCookiecostoperation) == "function" then
		costop1=gtbl.FlipCookiecostoperation(e,tp,eg,ep,ev,re,r,rp) end
	else end end
	if not hpcookie2:IsSetCard(0xa16) then
	Duel.Remove(hpcookie2,POS_FACEUP,REASON_RULE)
	Duel.SendtoGrave(hpcookie2,REASON_RULE|REASON_RETURN) end
end

function Cookie7.hpaddop2(e,tp,eg,ep,ev,re,r,rp,g,hp)
	local typ=type(g)
	if typ=="Card" and g==nil then return
	elseif typ=="Group" and #g==0 then return end
	local hg
	if typ=="Card" then hg=g
	elseif typ=="Group" then hg=g:GetFirst() end
	hg=Cookie7.hp_heal_redirect(hg)
	if not hg then return end
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
	e2:SetCondition(Cookie7.szonecon)
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
	local e4=Effect.CreateEffect(c)
	e4:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e4:SetCode(EVENT_TO_DECK)
	e4:SetOperation(Cookie7.hpcookietodeck)
	e4:SetLabel(hpcode)
	hpcookie:RegisterEffect(e4)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
	heal=heal+1 end
end

--쿠키 체력 채우기(앞면)
function Cookie7.faceuphpaddop(e,tp,eg,ep,ev,re,r,rp,player,g,hp)
	local c=e:GetHandler()
	if not g then return end
	local hg
	if g.GetFirst then hg=g:GetFirst() else hg=g end
	hg=Cookie7.hp_heal_redirect(hg)
	if not hg then return end

	local allhpcard=hg:GetOverlayGroup()
	local nofaceuphpcard=allhpcard:Filter(Card.IsCode,nil,10060001)
	local faceuphpcard=allhpcard:Filter(aux.NOT(Card.IsCode),nil,10060001)
	local nofaceuphpcardcount=#nofaceuphpcard
	local faceuphpcardcount=#faceuphpcard

	local faceuporder={}
	for tc in aux.Next(faceuphpcard) do	faceuporder[#faceuporder+1]=tc end
	table.sort(faceuporder,function(a,b) return a:GetSequence()<b:GetSequence() end)

	local nofaceuporder={}
	for tc in aux.Next(nofaceuphpcard) do nofaceuporder[#nofaceuporder+1]=tc end
	table.sort(nofaceuporder,function(a,b) return a:GetSequence()>b:GetSequence() end)

	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if not ally then return end
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xa07)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
	ally:RegisterEffect(e1)
	if ally:IsSetCard(0xa15) then return end

	Duel.DisableShuffleCheck()
	local heal=0
	while heal<hp do
		local decktop=Duel.GetDecktopGroup(player,1)
		Duel.Overlay(hg,decktop)
		local tc=decktop:GetFirst()
		if tc and tc:GetFlagEffect(Cookie7.FACEUP_MOVE_FLAG)==0 then
			local e1=Effect.CreateEffect(hg)
			e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
			e1:SetCode(EVENT_MOVE)
			e1:SetCondition(Cookie7.szonecon)
			e1:SetOperation(Cookie7.faceuphpcookietomove)
			e1:SetLabelObject(hg)
			tc:RegisterEffect(e1)
			tc:RegisterFlagEffect(Cookie7.FACEUP_MOVE_FLAG,0,0,1) end
		heal=heal+1
	end

	-- 최초 앞면 체력은 트래시에 보냈다가 같은 순서로 다시 HP에 올림(원래 주인 정보 유지)
	for _,tc in ipairs(faceuporder) do
		if tc:IsLocation(LOCATION_OVERLAY) and tc:GetOverlayTarget()==hg then
			Duel.SendtoGrave(tc,REASON_RULE)
		end
	end

	for _,tc in ipairs(faceuporder) do
		if tc:IsLocation(LOCATION_GRAVE) then
			Duel.Overlay(hg,tc)
		if tc and tc:GetFlagEffect(Cookie7.FACEUP_MOVE_FLAG)==0 then
			local e1=Effect.CreateEffect(hg)
			e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
			e1:SetCode(EVENT_MOVE)
			e1:SetCondition(Cookie7.szonecon)
			e1:SetOperation(Cookie7.faceuphpcookietomove)
			e1:SetLabelObject(hg)
			tc:RegisterEffect(e1)
			tc:RegisterFlagEffect(Cookie7.FACEUP_MOVE_FLAG,0,0,1)
		end
		end
	end

	-- 최초 뒷면 체력도 당시 순서(위->아래)대로 덱으로 보내고, 같은 수를 다시 뒷면으로 채움
	for _,tc in ipairs(nofaceuporder) do
		if tc:IsLocation(LOCATION_OVERLAY) and tc:GetOverlayTarget()==hg then
		Duel.SendtoDeck(tc,tc:GetOwner(),SEQ_DECKTOP,REASON_RULE)	end end
	Cookie7.hpaddop2(e,tp,eg,ep,ev,re,r,rp,hg,nofaceuphpcardcount)
end
function Cookie7.faceuphpcookietomove(e,tp,eg,ep,ev,re,r,rp)
	local hg=e:GetLabelObject()
	if not hg then return end
	local hpcookie2=e:GetHandler()
	hpcookie2:ResetFlagEffect(Cookie7.FACEUP_MOVE_FLAG)
	e:Reset()
	if hpcookie2:IsSetCard(0xb00) then
	local code=hpcookie2:GetCode()
	local gtbl=_G["c" .. code]
	local cost1=true
	if gtbl and type(gtbl.FlipCookiecost) == "function" then
		cost1=gtbl.FlipCookiecost(e,tp,eg,ep,ev,re,r,rp) end
	if not cost1 then
	Duel.Remove(hpcookie2,POS_FACEUP,REASON_RULE)
	Duel.SendtoGrave(hpcookie2,REASON_RULE|REASON_RETURN) return end
	local condition1=true
	local costop1=function(e,tp,eg,ep,ev,re,r,rp) return end
	local operation1=function(e,tp,eg,ep,ev,re,r,rp) return end
	if gtbl and type(gtbl.FlipCookieeffcondition) == "function" then
		condition1=gtbl.FlipCookieeffcondition(e,tp,eg,ep,ev,re,r,rp) end
	if not Duel.SelectYesNo(tp,aux.Stringid(10060001,0)) then
	Duel.Remove(hpcookie2,POS_FACEUP,REASON_RULE)
	Duel.SendtoGrave(hpcookie2,REASON_RULE|REASON_RETURN) return end
	if condition1 then
	if gtbl and type(gtbl.FlipCookiecostoperation) == "function" then
		costop1=gtbl.FlipCookiecostoperation(e,tp,eg,ep,ev,re,r,rp) end
	if gtbl and type(gtbl.FlipCookieoperation) == "function" then
		operation1=gtbl.FlipCookieoperation(e,tp,eg,ep,ev,re,r,rp) end
	elseif not condition1 and Duel.SelectYesNo(tp,aux.Stringid(10060001,10)) then
	if gtbl and type(gtbl.FlipCookiecostoperation) == "function" then
		costop1=gtbl.FlipCookiecostoperation(e,tp,eg,ep,ev,re,r,rp) end
	else end end
	if not hpcookie2:IsSetCard(0xa16) then
	Duel.Remove(hpcookie2,POS_FACEUP,REASON_RULE)
	Duel.SendtoGrave(hpcookie2,REASON_RULE|REASON_RETURN) end
end

--모든 쿠키 HP 추가하기
function Cookie7.Allhpaddop(e,tp,eg,ep,ev,re,r,rp,g,hp)
	while #g>1 do
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=g:FilterSelect(tp,aux.TRUE,1,1,nil)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,ag,hp)
	g:RemoveCard(ag) end
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,g,hp)
end

--쿠키 데미지 주기
function Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,ag,dam)
	local c=e:GetHandler()
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	local typ=type(ag)
	if typ=="Card" and ag==nil then return
	elseif typ=="Group" and #ag==0 then return end
	local tg
	if typ=="Card" then tg=ag
	elseif typ=="Group" then tg=ag:GetFirst() end
	if tg:IsCode(10063082) and Duel.GetFieldGroupCount(tg:GetControler(),LOCATION_HAND,0)<=5 then dam=0 end
	if dam>0 and tg:IsSetCard(0xd06) then dam=0
	elseif dam>1 and tg:IsSetCard(0xd061) then dam=1
	elseif dam>2 and tg:IsSetCard(0xd062) then dam=2 end
	if tg:IsSetCard(0xd081) then dam=math.max(0,dam-1)
	elseif tg:IsSetCard(0xd082) then dam=math.max(0,dam-2)
	elseif tg:IsSetCard(0xd083) then dam=math.max(0,dam-3) end
	--[칠리] 배틀에 있을 때, 레드 LV.2+ [아레나] 쿠키의 효과 대미지+1
	if c:IsSetCard(0xc01) and c:IsAttribute(ATTRIBUTE_FIRE) and c:IsLevelAbove(2)
	and Duel.IsExistingMatchingCard(Card.IsCode,tp,LOCATION_MZONE,0,1,nil,10067013) then dam=dam+1 end
	if Duel.GetTurnPlayer()==1-tp and tg:IsSetCard(0xd12) then dam=0 end
	Duel.Damage(1-c:GetControler(),dam,REASON_EFFECT)
	local damage=0
	while damage<dam and ((tg:GetOverlayCount()>0 and not tg:IsSetCard(0xa03)) or tg:GetOverlayCount()>1) do
	g=tg:GetOverlayGroup()
	last=g:GetFirst()
	tc=g:GetNext()
	for tc in aux.Next(g) do
		if tc:GetSequence()>last:GetSequence() then last=tc end
	end
	if (tg:IsSetCard(0xa02) or ally:IsSetCard(0xa02)) then Duel.SendtoGrave(last,REASON_EFFECT) else
	Duel.MoveToField(last,tg:GetControler(),tg:GetControler(),LOCATION_SZONE,POS_FACEUP,true) end
	damage=damage+1 end
	if tg:GetOverlayCount()==0 and tg:IsLocation(LOCATION_MZONE) then Cookie3.Cookiedestroyop2(e,tp,eg,ep,ev,re,r,rp,tg) end
	if tg:IsSetCard(0xd04) and tg:IsLocation(LOCATION_MZONE) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,tg) end
	if tg:IsSetCard(0xd15) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,tg) end
	if c:IsSetCard(0xc01) and c:IsControler(tp) then Duel.RegisterFlagEffect(tp,10080106,RESET_PHASE+PHASE_END,0,1) end
end

--쿠키 데미지 주기(2장)
function Cookie7.doubledamageeff(e,tp,eg,ep,ev,re,r,rp,g,dam1,dam2)
	local setsg=Group.CreateGroup()
	if #g==0 then return end
	if #g==1 then
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,dam1)
	else
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,3))
	local ag=g:FilterSelect(tp,aux.TRUE,1,1,nil)
	local bg=g:RemoveCard(ag)
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,ag,dam1)
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,bg,dam2) end
end

--모든 쿠키 대미지 주기
function Cookie7.Alldamageeff(e,tp,eg,ep,ev,re,r,rp,g,dam)
	while #g>1 do
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,3))
	local ag=g:FilterSelect(tp,aux.TRUE,1,1,nil)
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,ag,dam)
	g:RemoveCard(ag) end
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,dam)
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
	if Duel.GetTurnPlayer()==1-tp and tg:IsSetCard(0xd12) then dam=0 end
	Duel.Damage(1-c:GetControler(),dam,REASON_EFFECT)
	local trash=0
	while trash<dam and (tg:GetOverlayCount()>0 or (tg:IsSetCard(0xa03) and tg:GetOverlayCount()>1)) do
	g=tg:GetOverlayGroup()
	last=g:GetFirst()
	tc=g:GetNext()
	for tc in aux.Next(g) do
		if tc:GetSequence()>last:GetSequence() then last=tc end
	end
	Duel.SendtoGrave(last,REASON_EFFECT)
	trash=trash+1 end
	if tg:GetOverlayCount()==0 and tg:IsLocation(LOCATION_MZONE) then Cookie3.Cookiedestroyop2(e,tp,eg,ep,ev,re,r,rp,tg) end
	if tg:IsSetCard(0xd15) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,tg) end
end

--모든 쿠키 hp 트래시로 보내기
function Cookie7.Allhptrasheff(e,tp,eg,ep,ev,re,r,rp,g,dam)
	while #g>1 do
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,3))
	local ag=g:FilterSelect(tp,aux.TRUE,1,1,nil)
	Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,ag,dam)
	g:RemoveCard(ag) end
	Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,g,dam)
end

--쿠키 hp 덱 맨위로 보내기
function Cookie7.hpdecktop(e,tp,eg,ep,ev,re,r,rp,ag,dam)
	local c=e:GetHandler()
	local typ=type(ag)
	if typ=="Card" and ag==nil then return
	elseif typ=="Group" and #ag==0 then return end
	local tg
	if typ=="Card" then tg=ag
	elseif typ=="Group" then tg=ag:GetFirst() end
	Duel.Damage(1-c:GetControler(),dam,REASON_EFFECT)
	local damage=0
	while damage<dam and tg:GetOverlayCount()>0 do
	g=tg:GetOverlayGroup()
	last=g:GetFirst()
	tc=g:GetNext()
	for tc in aux.Next(g) do
		if tc:GetSequence()>last:GetSequence() then last=tc end
	end
	Duel.SendtoDeck(last,nil,SEQ_DECKTOP,REASON_EFFECT)
	damage=damage+1 end
	if tg:GetOverlayCount()==0 and tg:IsLocation(LOCATION_MZONE) then Cookie3.Cookiedestroyop2(e,tp,eg,ep,ev,re,r,rp,tg) end
	if tg:IsSetCard(0xd15) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,tg) end
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