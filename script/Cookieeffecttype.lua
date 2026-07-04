--쿠키의 효과처리 타입
Cookie6={}

--블로커 쿠키1
function Cookie6.BlockerCookieEffect(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10061009,0))
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_ATTACK_ANNOUNCE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCondition(function(e,tp,eg,ep,ev,re,r,rp)
	return Cookie6.blockercookiecon(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)	end)
	e1:SetTarget(Cookie3.notg)
	e1:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
	Cookie6.blockercookieop(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)	end)
	c:RegisterEffect(e1)
end
function Cookie6.blockercookiecon(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
	local c=e:GetHandler()
	local bt=Duel.GetAttackTarget()
	return c~=bt and bt:GetControler()==c:GetControler()
	and Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,attr,colorCount,mixCount)
	and Duel.GetMatchingGroupCount(Card.IsSetCard,tp,0,LOCATION_MZONE,nil,0xa01)==0
end
function Cookie6.blockercookieop(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
	Duel.ChangeAttackTarget(e:GetHandler())
end
--블로커 쿠키2
function Cookie6.RestBlockerCookieEffect(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10061009,0))
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_ATTACK_ANNOUNCE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCondition(function(e,tp,eg,ep,ev,re,r,rp)
	return Cookie6.blockercookiecon2(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount) end)
	e1:SetTarget(Cookie3.notg)
	e1:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
	Cookie6.blockercookieop2(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount) end)
	c:RegisterEffect(e1)
end
function Cookie6.blockercookiecon2(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
	local c=e:GetHandler()
	local bt=Duel.GetAttackTarget()
	return c~=bt and bt:GetControler()==c:GetControler() and c:IsAttackPos()
	and Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,attr,colorCount,mixCount)
	and Duel.GetMatchingGroupCount(Card.IsSetCard,tp,0,LOCATION_MZONE,nil,0xa01)==0
end
function Cookie6.blockercookieop2(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
	Duel.ChangePosition(e:GetHandler(),POS_FACEUP_DEFENSE)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
	Duel.ChangeAttackTarget(e:GetHandler())
end

--그리고 효과
function Cookie6.AndCoookieEffect(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
	local c=e:GetHandler()
	local code=c:GetCode()
	local gtbl=_G["c" .. code]
	local cost1=true
	if gtbl and type(gtbl.AndCookiecost) == "function" then
		cost1=gtbl.AndCookiecost(e,tp,eg,ep,ev,re,r,rp) end
	if not cost1 then return end
	local condition1=true
	local costop1=function(e,tp,eg,ep,ev,re,r,rp) return end
	local operation1=function(e,tp,eg,ep,ev,re,r,rp) return end
	if gtbl and type(gtbl.AndCookieeffcondition) == "function" then
		condition1=gtbl.AndCookieeffcondition(e,tp,eg,ep,ev,re,r,rp) end
	if not Duel.SelectYesNo(tp,aux.Stringid(10060003,1)) then return end
	if condition1 then
	if gtbl and type(gtbl.AndCookiecostoperation) == "function" then
		costop1=gtbl.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp) end
	if gtbl and type(gtbl.AndCookieoperation) == "function" then
		operation1=gtbl.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp) end
	elseif not condition1 and Duel.SelectYesNo(tp,aux.Stringid(10060001,10)) then
	if gtbl and type(gtbl.AndCookiecostoperation) == "function" then
		costop1=gtbl.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp) end
	else return end
end

--그리고 효과(강제)
function Cookie6.AndCoookieEffect2(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
	local c=e:GetHandler()
	local code=c:GetCode()
	local gtbl=_G["c" .. code]
	local operation1=function(e,tp,eg,ep,ev,re,r,rp) return end
	if gtbl and type(gtbl.AndCookieoperation) == "function" then
		operation1=gtbl.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp) end
end

--기동효과
function Cookie6.IGCoookieEffect(c,countlimit,attr,colorCount,mixCount)
	c:EnableCounterPermit(0x1001)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060000,7))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCondition(Cookie6.IGCookiecon)
	e1:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
		local code=c:GetCode()
		local gtbl=_G["c" .. code]
		local cost1=true
		if gtbl and type(gtbl.IGCookiecost) == "function" then
			cost1=gtbl.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk) end
		--10091031 푸드덕 날개 나무
		local handok=true
		if e:GetHandler():IsSetCard(0xa19) and e:GetHandler():IsSetCard(0xc11) then
			handok=Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,0,ALL_COLOR,2,2) end
		if chk==0 then return ((countlimit==0) or c:GetCounter(0x1001)==0)
			and Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,attr,colorCount,mixCount) and cost1 and handok end
		Duel.SetChainLimit(aux.FALSE) end)
	e1:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
		local code=c:GetCode()
		local gtbl=_G["c" .. code]
		local condition1=true
		local costop1=function(e,tp,eg,ep,ev,re,r,rp) return end
		local operation1=function(e,tp,eg,ep,ev,re,r,rp) return end
		if gtbl and type(gtbl.IGCookieeffcondition) == "function" then
			condition1=gtbl.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp) end
		if condition1 then
			if countlimit==1 then c:AddCounter(0x1001,1) end
			Cookie6.IGA19Handcost(e,tp,eg,ep,ev,re,r,rp)
			Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
		if gtbl and type(gtbl.IGCookiecostoperation) == "function" then
			costop1=gtbl.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp) end
		if gtbl and type(gtbl.IGCookieoperation) == "function" then
			operation1=gtbl.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp) end
		elseif not condition1 and Duel.SelectYesNo(tp,aux.Stringid(10060001,10)) then
			if countlimit==1 then c:AddCounter(0x1001,1) end
			Cookie6.IGA19Handcost(e,tp,eg,ep,ev,re,r,rp)
			Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
		if gtbl and type(gtbl.IGCookiecostoperation) == "function" then
			costop1=gtbl.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp) end
		else return end
	end)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(10060000,10))
	e2:SetType(EFFECT_TYPE_QUICK_O)
	e2:SetCode(EVENT_FREE_CHAIN)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCondition(Cookie6.IGCookiecon)
	e2:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
		local code=c:GetCode()
		local gtbl=_G["c" .. code]
		local cost1=true
		if gtbl and type(gtbl.IGCookiecost) == "function" then
			cost1=gtbl.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)	end
		if chk==0 then return not (((countlimit==0) or c:GetCounter(0x1001)==0)
			and Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,attr,colorCount,mixCount) and cost1) end
		Duel.SetChainLimit(aux.FALSE) end)
	c:RegisterEffect(e2)
end
--10091031 푸드덕 날개 나무
function Cookie6.IGA19Handcost(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if c:IsSetCard(0xa19) and c:IsSetCard(0xc11) then Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,2,2) end
end
function Cookie6.IGCookiecon(e)
	local tp=e:GetHandlerPlayer()
	local c=e:GetHandler()
	return Duel.GetTurnPlayer()==tp and Duel.GetCurrentPhase()==PHASE_BATTLE_STEP
	and not (Duel.GetAttacker() and Duel.GetAttacker():IsControler(tp)) and e:GetHandler():GetCounter(0x1001)==0
end

--자동효과
Cookie6.APPCHANGE_FLAG=0xd190
function Cookie6.RegisterAppChange(tp,cardid)
	if not Cookie6.appchange_label then Cookie6.appchange_label={} end
	Cookie6.appchange_label[tp]=cardid
	Duel.RegisterFlagEffect(tp,Cookie6.APPCHANGE_FLAG,RESET_PHASE+PHASE_END,0,1)
end
function Cookie6.GetAppChange(tp)
	if Duel.GetFlagEffect(tp,Cookie6.APPCHANGE_FLAG)==0 then return nil end
	if not Cookie6.appchange_label then return nil end
	return Cookie6.appchange_label[tp]
end
function Cookie6.QEappearblocked(hc,tp)
	if not hc:IsSetCard(0xc10) then return false end
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally and ally:IsSetCard(0xa18) then return true end
	if ally and ally:IsSetCard(0xa181) and hc:IsLevelAbove(2) then return true end
	return false
end
function Cookie6.QEappearanceresolve(hc,attr,colorCount,mixCount)
	local code=hc:GetCode()
	local tp=hc:GetControler()
	if not hc:IsSetCard(0xc10) then
		return code,attr,colorCount,mixCount end
	local last=Cookie6.GetAppChange(tp)
	if last==10091047 then
		return 10091047,ALL_COLOR,0,1 end
	if last==10091064 then
		return 10091064,ALL_COLOR,0,1 end
	if last==10091083 then
		return 10091083,ALL_COLOR,0,1 end
	return code,attr,colorCount,mixCount
end
function Cookie6.QEoptionalforced(hc,QEcode,mix2)
	return mix2>0 and QEcode~=hc:GetCode()
end
function Cookie6.QECoookieEffect(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060000,7))
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e1:SetCode(EVENT_CHAIN_END)
	e1:SetRange(LOCATION_TRIGGERZONE)
	e1:SetCondition(Cookie8.eventcon)
	e1:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
		local hc=e:GetHandler()
		local p=hc:GetControler()
		if chk==0 and Cookie6.QEappearblocked(hc,p) then return false end
		local QEcode,attr2,cc2,mix2=Cookie6.QEappearanceresolve(hc,attr,colorCount,mixCount)
		local gtbl=_G["c" .. QEcode]
		local cost1=true
		if gtbl and type(gtbl.QECookiecost) == "function" then
			cost1=gtbl.QECookiecost(e,p,eg,ep,ev,re,r,rp,chk) end
		if chk==0 then return Cookie3.manacon(e,p,eg,ep,ev,re,r,rp,chk,attr2,cc2,mix2) and cost1 end
		Duel.SetChainLimit(aux.FALSE) end)
	e1:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
		local hc=e:GetHandler()
		local p=hc:GetControler()
		if Cookie6.QEappearblocked(hc,p) then return hc:SetTurnCounter(0) end
		local QEcode,attr2,cc2,mix2=Cookie6.QEappearanceresolve(hc,attr,colorCount,mixCount)
		local gtbl=_G["c" .. QEcode]
		local condition1=true
		local costop1=function(e,tp,eg,ep,ev,re,r,rp) return end
		local operation1=function(e,tp,eg,ep,ev,re,r,rp) return end
		if gtbl and type(gtbl.QECookieeffcondition) == "function" then
			condition1=gtbl.QECookieeffcondition(e,p,eg,ep,ev,re,r,rp) end
		if not Duel.SelectYesNo(p,aux.Stringid(QEcode,0)) then return hc:SetTurnCounter(0) end
		if condition1 then
			if not Cookie3.manacon(e,p,eg,ep,ev,re,r,rp,0,attr2,cc2,mix2) then return hc:SetTurnCounter(0) end
			if gtbl and type(gtbl.QECookiecost)=="function" and not gtbl.QECookiecost(e,p,eg,ep,ev,re,r,rp,0) then
				return hc:SetTurnCounter(0) end
			if not Cookie3.manacost(e,p,eg,ep,ev,re,r,rp,attr2,cc2,mix2) then return hc:SetTurnCounter(0) end
		if gtbl and type(gtbl.QECookiecostoperation) == "function" then
			costop1=gtbl.QECookiecostoperation(e,p,eg,ep,ev,re,r,rp) end
		if gtbl and type(gtbl.QECookieoperation) == "function" then
			operation1=gtbl.QECookieoperation(e,p,eg,ep,ev,re,r,rp)
			if not hc:IsSetCard(0xd14) then hc:SetTurnCounter(0) end
		elseif not condition1 and Duel.SelectYesNo(p,aux.Stringid(10060001,10)) then
			if not Cookie3.manacon(e,p,eg,ep,ev,re,r,rp,0,attr2,cc2,mix2) then return hc:SetTurnCounter(0) end
			if gtbl and type(gtbl.QECookiecost)=="function" and not gtbl.QECookiecost(e,p,eg,ep,ev,re,r,rp,0) then
				return hc:SetTurnCounter(0) end
			if not Cookie3.manacost(e,p,eg,ep,ev,re,r,rp,attr2,cc2,mix2) then return hc:SetTurnCounter(0) end
			if not hc:IsSetCard(0xd14) then hc:SetTurnCounter(0) end
		if gtbl and type(gtbl.QECookiecostoperation) == "function" then
			costop1=gtbl.QECookiecostoperation(e,p,eg,ep,ev,re,r,rp) end
		elseif hc:IsSetCard(0xd14) then return end
		else return hc:SetTurnCounter(0) end
	end)
	c:RegisterEffect(e1)
	local e3=e1:Clone()
	e3:SetCode(EVENT_SPSUMMON_SUCCESS)
	e3:SetCondition(Cookie8.eventcon2)
	c:RegisterEffect(e3)
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(10060000,10))
	e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e2:SetCode(EVENT_CHAIN_END)
	e2:SetRange(LOCATION_TRIGGERZONE)
	e2:SetCondition(Cookie8.eventcon)
	e2:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
		local hc=e:GetHandler()
		local p=hc:GetControler()
		if chk==0 and Cookie6.QEappearblocked(hc,p) then return true end
		local QEcode,attr2,cc2,mix2=Cookie6.QEappearanceresolve(hc,attr,colorCount,mixCount)
		local gtbl=_G["c" .. QEcode]
		local cost1=true
		if gtbl and type(gtbl.QECookiecost) == "function" then
			cost1=gtbl.QECookiecost(e,p,eg,ep,ev,re,r,rp,chk)	end
		if chk==0 then return not (Cookie3.manacon(e,p,eg,ep,ev,re,r,rp,chk,attr2,cc2,mix2) and cost1) end
		Duel.SetChainLimit(aux.FALSE) end)
	e2:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
		e:GetHandler():SetTurnCounter(0) end)
	c:RegisterEffect(e2)
	local e4=e2:Clone()
	e4:SetCode(EVENT_SPSUMMON_SUCCESS)
	e4:SetCondition(Cookie8.eventcon2)
	c:RegisterEffect(e4)
end

--자동효과(강제)
function Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060000,7))
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e1:SetCode(EVENT_CHAIN_END)
	e1:SetRange(LOCATION_TRIGGERZONE)
	e1:SetCondition(Cookie8.eventcon)
	e1:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
		local hc=e:GetHandler()
		local p=hc:GetControler()
		if chk==0 and Cookie6.QEappearblocked(hc,p) then return false end
		local QEcode,attr2,cc2,mix2=Cookie6.QEappearanceresolve(hc,0,0,0)
		local gtbl=_G["c" .. QEcode]
		local cost1=true
		if gtbl and type(gtbl.QECookiecost)=="function" then
			cost1=gtbl.QECookiecost(e,p,eg,ep,ev,re,r,rp,chk) end
		if chk==0 then return Cookie3.manacon(e,p,eg,ep,ev,re,r,rp,chk,attr2,cc2,mix2) and cost1 end
		Duel.SetChainLimit(aux.FALSE) end)
	e1:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
		local hc=e:GetHandler()
		local p=hc:GetControler()
		if Cookie6.QEappearblocked(hc,p) then return hc:SetTurnCounter(0) end
		local QEcode,attr2,cc2,mix2=Cookie6.QEappearanceresolve(hc,0,0,0)
		local gtbl=_G["c" .. QEcode]
		if Cookie6.QEoptionalforced(hc,QEcode,mix2) and not Duel.SelectYesNo(p,aux.Stringid(QEcode,0)) then
			return hc:SetTurnCounter(0) end
		if not Cookie3.manacon(e,p,eg,ep,ev,re,r,rp,0,attr2,cc2,mix2) then return hc:SetTurnCounter(0) end
		if gtbl and type(gtbl.QECookiecost)=="function" and not gtbl.QECookiecost(e,p,eg,ep,ev,re,r,rp,0) then
			return hc:SetTurnCounter(0) end
		if not Cookie3.manacost(e,p,eg,ep,ev,re,r,rp,attr2,cc2,mix2) then return hc:SetTurnCounter(0) end
		if gtbl and type(gtbl.QECookiecostoperation)=="function" then
			gtbl.QECookiecostoperation(e,p,eg,ep,ev,re,r,rp) end
		if gtbl and type(gtbl.QECookieoperation)=="function" then
			gtbl.QECookieoperation(e,p,eg,ep,ev,re,r,rp) end
		hc:SetTurnCounter(0) end)
	c:RegisterEffect(e1)
	local e2=e1:Clone()
	e2:SetCode(EVENT_SPSUMMON_SUCCESS)
	e2:SetCondition(Cookie8.eventcon2)
	c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(10060000,10))
	e3:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e3:SetCode(EVENT_CHAIN_END)
	e3:SetRange(LOCATION_TRIGGERZONE)
	e3:SetCondition(Cookie8.eventcon)
	e3:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
		local hc=e:GetHandler()
		local p=hc:GetControler()
		if chk==0 and Cookie6.QEappearblocked(hc,p) then return true end
		local QEcode,attr2,cc2,mix2=Cookie6.QEappearanceresolve(hc,0,0,0)
		local gtbl=_G["c" .. QEcode]
		local cost1=true
		if gtbl and type(gtbl.QECookiecost)=="function" then
			cost1=gtbl.QECookiecost(e,p,eg,ep,ev,re,r,rp,chk) end
		if chk==0 then return not (Cookie3.manacon(e,p,eg,ep,ev,re,r,rp,chk,attr2,cc2,mix2) and cost1) end
		Duel.SetChainLimit(aux.FALSE) end)
	e3:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
		e:GetHandler():SetTurnCounter(0) end)
	c:RegisterEffect(e3)
	local e4=e3:Clone()
	e4:SetCode(EVENT_SPSUMMON_SUCCESS)
	e4:SetCondition(Cookie8.eventcon2)
	c:RegisterEffect(e4)
end

--상대의 공격
Cookie6.DEFCOOKIE_COUNTER=0x1002
function Cookie6.DefenseEffect(c,countlimit,attr,colorCount,mixCount)
	if countlimit==1 then
		c:EnableCounterPermit(Cookie6.DEFCOOKIE_COUNTER)
		local e_reset=Effect.CreateEffect(c)
		e_reset:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
		e_reset:SetCode(EVENT_PHASE+PHASE_END)
		e_reset:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
		e_reset:SetCondition(function(e) return e:GetHandler():GetCounter(Cookie6.DEFCOOKIE_COUNTER)>0 end)
		e_reset:SetOperation(Cookie6.Defensecounterreset)
		c:RegisterEffect(e_reset)
	end
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060000,5))
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_ATTACK_ANNOUNCE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCondition(Cookie6.Defensecon)
	e1:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
		local code=c:GetCode()
		local gtbl=_G["c" .. code]
		local cost2=true
		if gtbl and type(gtbl.Defensecost) == "function" then
			cost2=gtbl.Defensecost(e,tp,eg,ep,ev,re,r,rp,chk)	end
		if chk==0 then return ((countlimit==0) or c:GetCounter(Cookie6.DEFCOOKIE_COUNTER)==0)
			and Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,attr,colorCount,mixCount) and cost2 end
		Duel.SetChainLimit(aux.FALSE) end)
	e1:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
		local code=c:GetCode()
		local gtbl=_G["c" .. code]
		local condition1=true
		local costop1=function(e,tp,eg,ep,ev,re,r,rp) return end
		local operation1=function(e,tp,eg,ep,ev,re,r,rp) return end
		if gtbl and type(gtbl.Defenseeffcondition) == "function" then
			condition1=gtbl.Defenseeffcondition(e,tp,eg,ep,ev,re,r,rp) end
		if condition1 then
			if countlimit==1 then c:AddCounter(Cookie6.DEFCOOKIE_COUNTER,1) end
			Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
		if gtbl and type(gtbl.Defensecostoperation) == "function" then
			costop1=gtbl.Defensecostoperation(e,tp,eg,ep,ev,re,r,rp) end
		if gtbl and type(gtbl.Defenseoperation) == "function" then
			operation1=gtbl.Defenseoperation(e,tp,eg,ep,ev,re,r,rp) end
		elseif not condition1 and Duel.SelectYesNo(tp,aux.Stringid(10060001,10)) then
			if countlimit==1 then c:AddCounter(Cookie6.DEFCOOKIE_COUNTER,1) end
			Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
		if gtbl and type(gtbl.Defensecostoperation) == "function" then
			costop1=gtbl.Defensecostoperation(e,tp,eg,ep,ev,re,r,rp) end
		else return end
	end)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(10060000,5))
	e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_QUICK_O)
	e2:SetCode(EVENT_ATTACK_ANNOUNCE)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCondition(Cookie6.Defensecon)
	e2:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
		local code=c:GetCode()
		local gtbl=_G["c" .. code]
		local cost2=true
		if gtbl and type(gtbl.Defensecost) == "function" then
			cost2=gtbl.Defensecost(e,tp,eg,ep,ev,re,r,rp,chk) end
		if chk==0 then return not (((countlimit==0) or c:GetCounter(Cookie6.DEFCOOKIE_COUNTER)==0)
			and Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,attr,colorCount,mixCount) and cost2) end
		Duel.SetChainLimit(aux.FALSE) end)
	c:RegisterEffect(e2)
end
function Cookie6.Defensecounterreset(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if c:GetCounter(Cookie6.DEFCOOKIE_COUNTER)>0 then c:RemoveCounter(c:GetControler(),Cookie6.DEFCOOKIE_COUNTER,c:GetCounter(Cookie6.DEFCOOKIE_COUNTER),REASON_EFFECT) end
end
function Cookie6.Defensecon(e)
	local tp=e:GetHandlerPlayer()
	return Duel.GetTurnPlayer()==1-tp and Duel.GetAttacker()
	and Duel.GetAttacker():IsControler(1-tp) and Duel.GetCurrentPhase()<=PHASE_BATTLE
end

--I아이템
function Cookie6.ItemEffect(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060000,7))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(Cookie6.Itemcon)
	e1:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
		local code=c:GetCode()
		local gtbl=_G["c" .. code]
		local cost1=true
		if gtbl and type(gtbl.Itemcost) == "function" then
			cost1=gtbl.Itemcost(e,tp,eg,ep,ev,re,r,rp,chk) end
		if chk==0 then return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,attr,colorCount,mixCount) and cost1 end
		Duel.SetChainLimit(aux.FALSE) end)
	e1:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
		local code=c:GetCode()
		local gtbl=_G["c" .. code]
		local condition1=true
		local costop1=function(e,tp,eg,ep,ev,re,r,rp) return end
		local operation1=function(e,tp,eg,ep,ev,re,r,rp) return end
		if gtbl and type(gtbl.Itemeffcondition) == "function" then
			condition1=gtbl.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp) end
		if condition1 then
			Duel.SendtoGrave(e:GetHandler(),REASON_RULE)
			Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
		if gtbl and type(gtbl.Itemcostoperation) == "function" then
			costop1=gtbl.Itemcostoperation(e,tp,eg,ep,ev,re,r,rp) end
		if gtbl and type(gtbl.Itemoperation) == "function" then
			operation1=gtbl.Itemoperation(e,tp,eg,ep,ev,re,r,rp) end
		elseif not condition1 and Duel.SelectYesNo(tp,aux.Stringid(10060001,10)) then
			Duel.SendtoGrave(e:GetHandler(),REASON_RULE)
			Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
		if gtbl and type(gtbl.Itemcostoperation) == "function" then
			costop1=gtbl.Itemcostoperation(e,tp,eg,ep,ev,re,r,rp) end
		else return end
	end)
	c:RegisterEffect(e1)
end
function Cookie6.Itemcon(e)
	local tp=e:GetHandlerPlayer()
	return Duel.GetTurnPlayer()==tp and Duel.GetCurrentPhase()==PHASE_BATTLE_STEP
	and not (Duel.GetAttacker() and Duel.GetAttacker():IsControler(tp))
end

--T트랩
function Cookie6.TrapEffect(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060000,8))
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_ATTACK_ANNOUNCE)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(Cookie6.Trapcon)
	e1:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
		local code=c:GetCode()
		local gtbl=_G["c" .. code]
		local cost2=true
		if gtbl and type(gtbl.Trapcost) == "function" then
			cost2=gtbl.Trapcost(e,tp,eg,ep,ev,re,r,rp,chk)	end
		if chk==0 then return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,attr,colorCount,mixCount) and cost2 end
		Duel.SetChainLimit(aux.FALSE) end)
	e1:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
		local code=c:GetCode()
		local gtbl=_G["c" .. code]
		local condition1=true
		local costop1=function(e,tp,eg,ep,ev,re,r,rp) return end
		local operation1=function(e,tp,eg,ep,ev,re,r,rp) return end
		if gtbl and type(gtbl.Trapeffcondition) == "function" then
			condition1=gtbl.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp) end
		if condition1 then
			Duel.SendtoGrave(e:GetHandler(),REASON_RULE)
			Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
		if gtbl and type(gtbl.Trapcostoperation) == "function" then
			costop1=gtbl.Trapcostoperation(e,tp,eg,ep,ev,re,r,rp) end
		if gtbl and type(gtbl.Trapoperation) == "function" then
			operation1=gtbl.Trapoperation(e,tp,eg,ep,ev,re,r,rp) end
		elseif not condition1 and Duel.SelectYesNo(tp,aux.Stringid(10060001,10)) then
			Duel.SendtoGrave(e:GetHandler(),REASON_RULE)
			Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
		if gtbl and type(gtbl.Trapcostoperation) == "function" then
			costop1=gtbl.Trapcostoperation(e,tp,eg,ep,ev,re,r,rp) end
		else return end
	end)
	c:RegisterEffect(e1)
end
function Cookie6.Trapcon(e)
	local tp=e:GetHandlerPlayer()
	local em=Duel.GetMatchingGroup(Card.IsFaceup,tp,0,LOCATION_EMZONE,nil):GetFirst()
	return Duel.GetTurnPlayer()==1-tp and Duel.GetAttacker() and not em:IsSetCard(0xa06)
	and Duel.GetAttacker():IsControler(1-tp) and Duel.GetCurrentPhase()<=PHASE_BATTLE
end

--S스테이지
function Cookie6.StageEffect(c,attr,stcolorCount,stmixCount,effcolorCount,effmixCount)
	c:EnableCounterPermit(0x1000)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060000,9))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(Cookie6.Itemcon)
	e1:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
		if chk==0 then return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,attr,stcolorCount,stmixCount) end
		Duel.SetChainLimit(aux.FALSE) end)
	e1:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
		Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,stcolorCount,stmixCount)
		Duel.MoveToField(e:GetHandler(),tp,tp,LOCATION_FZONE,POS_FACEUP,true) end)
	c:RegisterEffect(e1)
	
	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(10060000,9))
	e3:SetType(EFFECT_TYPE_QUICK_O)
	e3:SetCode(EVENT_FREE_CHAIN)
	e3:SetRange(LOCATION_FZONE)
	e3:SetHintTiming(TIMING_BATTLE_PHASE,TIMING_BATTLE_PHASE)
	e3:SetCondition(function(e,tp,eg,ep,ev,re,r,rp)
		return Cookie6.Itemcon(e) and e:GetHandler():GetCounter(0x1000)==0 end)
	e3:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
		local code=c:GetCode()
		local gtbl=_G["c" .. code]
		local cost1=true
		if gtbl and type(gtbl.Stagecost) == "function" then
			cost1=gtbl.Stagecost(e,tp,eg,ep,ev,re,r,rp,chk) end
		if chk==0 then return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,attr,effcolorCount,effmixCount) and cost1 end
		Duel.SetChainLimit(aux.FALSE) end)
	e3:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
		local code=c:GetCode()
		local gtbl=_G["c" .. code]
		local condition1=true
		local costop1=function(e,tp,eg,ep,ev,re,r,rp) return end
		local operation1=function(e,tp,eg,ep,ev,re,r,rp) return end
		if gtbl and type(gtbl.Stageeffcondition) == "function" then
			condition1=gtbl.Stageeffcondition(e,tp,eg,ep,ev,re,r,rp) end
		if condition1 then
			Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,effcolorCount,effmixCount)
		if gtbl and type(gtbl.Stagecostoperation) == "function" then
			costop1=gtbl.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp) end
		if gtbl and type(gtbl.Stageoperation) == "function" then
			operation1=gtbl.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
			e:GetHandler():AddCounter(0x1000,1) end
		elseif not condition1 and Duel.SelectYesNo(tp,aux.Stringid(10060001,10)) then
			Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,effcolorCount,effmixCount)
		if gtbl and type(gtbl.Stagecostoperation) == "function" then
			costop1=gtbl.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
			e:GetHandler():AddCounter(0x1000,1) end
		else return end
	end)
	c:RegisterEffect(e3)
end