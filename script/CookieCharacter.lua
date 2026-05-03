--쿠키런 브레이버스의 쿠키들
Cookie2={}

--카드명 지정(아레나)
CARD_CAPSAICIN={10063015,10064012,10067014,10070609}
CARD_PRUNE_JUICE={10063112,10067104}
CARD_KOUIGN_AMANN={10063086,10067035}
--카드명 지정(에인션트)
CARD_HOLLYBERRY={10063017,10069017,10090021,10090024}
CARD_GOLD_CHEESE={10063025,10068026,10068027,10069024}
CARD_WHITE_LILY={10063055,10069078,10090069,10090073}
CARD_PURE_VANILLA={10063088,10069065,10069088,10069089}
CARD_DARK_CACAO={10063100,10068103,10068104,10069097}
--카드명 지정(비스트)
CARD_BURNING_SPICE={10068009}
CARD_ETERNAL_SUGAR={10090049,10080077}
CARD_MYSTIC_FLOUR={10068059}
CARD_SHADOW_MILK={10069010,10069030,10069055,10069079,10069102,10080063}
CARD_SILENT_SALT={10090122}
--카드명 지정(드래곤)
CARD_PITAYA_DRAGON={10063010,10065013,10070604}
CARD_ANANAS_DRAGON={10065040}
CARD_LONGAN_DRAGON={10065056}
CARD_LOTUS_DRAGON={10065071}
CARD_LYCHEE_DRAGON={10065092}
--카드명 지정(기타)
CARD_MARZIPAN_COOKIES={10063027,10080025,10080026,10080027}

--쿠키 유틸
function Cookie2.CookieCharacter(c,attr,colorCount,mixCount)
	c:EnableCounterPermit(0xa02)
	c:EnableCounterPermit(0xa03)
	c:EnableCounterPermit(0x1001)
	c:EnableCounterPermit(0x1003)
	Cookie2.SummonCookie(c)
	Cookie2.CookieEff(c)
	Cookie2.BattleEff(c,attr,colorCount,mixCount)
	Cookie2.battlemanacost(attr,colorCount,mixCount)(c)
end

--쿠키 소환
function Cookie2.SummonCookie(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(Cookie2.Summoncon)
	e1:SetTarget(Cookie3.notg)
	e1:SetOperation(Cookie2.Summonop)
	c:RegisterEffect(e1)
end
function Cookie2.Summoncon(e)
	local tp=e:GetHandlerPlayer()
	return Duel.GetLocationCount(tp,LOCATION_MZONE)>0 and Duel.GetTurnPlayer()==tp and Duel.GetCurrentPhase()==PHASE_BATTLE_STEP
	and not (Duel.GetAttacker() and Duel.GetAttacker():IsControler(tp)) and Duel.GetCurrentChain()==0
end
function Cookie2.Summonop(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler())
end

--유희왕과 다른 룰(1표시형식변경불가,2수비공격가능,3~4무량공격,5체력은수비력,6hp채우기,7전투파괴X)
function Cookie2.CookieEff(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e1:SetCode(EFFECT_CANNOT_CHANGE_POSITION)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e2:SetCode(EFFECT_DEFENSE_ATTACK)
	e2:SetValue(1)
	c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
    e3:SetType(EFFECT_TYPE_SINGLE)
	e3:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
    e3:SetCode(EFFECT_EXTRA_ATTACK)
    e3:SetValue(100)
    c:RegisterEffect(e3)
	local e4=Effect.CreateEffect(c)
    e4:SetType(EFFECT_TYPE_SINGLE)
	e4:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e4:SetCode(EFFECT_CANNOT_ATTACK_ANNOUNCE)
	e4:SetCondition(Cookie2.atcon)
	c:RegisterEffect(e4)
	local e5=Effect.CreateEffect(c)
	e5:SetType(EFFECT_TYPE_SINGLE)
	e5:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e5:SetCode(EFFECT_SET_DEFENSE)
	e5:SetRange(LOCATION_MZONE)
	e5:SetValue(Cookie2.hpval)
	c:RegisterEffect(e5)
	local e6=Effect.CreateEffect(c)
	e6:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e6:SetCode(EVENT_SPSUMMON_SUCCESS)
	e6:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e6:SetOperation(Cookie2.hpop)
	c:RegisterEffect(e6)
	local e7=Effect.CreateEffect(c)
	e7:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e7:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e7:SetCode(EFFECT_DESTROY_REPLACE)
	e7:SetRange(LOCATION_MZONE)
	e7:SetTarget(Cookie2.NoBtDestroy)
	c:RegisterEffect(e7)
	local e8=Effect.CreateEffect(c)
	e8:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
	e8:SetCode(EVENT_MOVE)
	e8:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e8:SetCondition(Cookie2.movecon)
	e8:SetOperation(Cookie2.moveop)
	c:RegisterEffect(e8)
end
function Cookie2.atcon(e,tp,eg,ep,ev,re,r,rp)
	local tp=e:GetHandlerPlayer()
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally:IsSetCard(0x001) then return e:GetHandler():IsDefensePos()
	else return e:GetHandler():IsDefensePos() or Duel.GetTurnCount()==1 end
end
function Cookie2.hpval(e,c)
	return c:GetOverlayGroup():GetCount()
end
function Cookie2.hpop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local hp=c:GetBaseDefense()
	if c:IsSetCard(0xa14) then hp=0 end
	Cookie7.hpaddop2(e,tp,eg,ep,ev,re,r,rp,c,hp)
end
function Cookie2.NoBtDestroy(e,tp,eg,ep,ev,re,r,rp,chk)
	local c=e:GetHandler()
	if chk==0 then return c:IsReason(REASON_BATTLE) and not c:IsReason(REASON_REPLACE) end
	return true
end
function Cookie2.movecon(e)
	return e:GetHandler():GetTurnCounter()>0
end
function Cookie2.moveop(e,tp,eg,ep,ev,re,r,rp)
	e:GetHandler():SetTurnCounter(0)
end

--배틀 페이즈 쿠키의 효과(데미지체크)
function Cookie2.BattleEff(c,attr,colorCount,mixCount)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_QUICK_F)
	e1:SetCode(EVENT_BATTLE_CONFIRM)
	e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
	e1:SetCondition(Cookie2.damagecon)
	e1:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
		Cookie2.damagecheck(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
	end)
	c:RegisterEffect(e1)
end
function Cookie2.damagecon(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler()==Duel.GetAttacker()
end
function Cookie2.damagecheck(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
	local c=e:GetHandler()
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	local bc=c:GetBattleTarget()
	if not bc then return end
	local dam=c:GetAttack()
	if dam>0 and bc:IsSetCard(0xd05) then dam=0
	elseif dam>1 and bc:IsSetCard(0xd051) then dam=1
	elseif dam>2 and bc:IsSetCard(0xd052) then dam=2 end
	if bc:IsSetCard(0xd071) then dam=math.max(0,dam-1)
	elseif bc:IsSetCard(0xd072) then dam=math.max(0,dam-2)
	elseif bc:IsSetCard(0xd073) then dam=math.max(0,dam-3) end
	Duel.Damage(1-c:GetControler(),dam,REASON_EFFECT)
	local damage=0
	while damage<dam and ((bc:GetOverlayCount()>0 and not bc:IsSetCard(0xa03)) or bc:GetOverlayCount()>1) do
	g=bc:GetOverlayGroup()
	last=g:GetFirst()
	tc=g:GetNext()
	for tc in aux.Next(g) do
		if tc:GetSequence()>last:GetSequence() then last=tc end
	end
	if (bc:IsSetCard(0xa02) or ally:IsSetCard(0xa02)) then Duel.SendtoGrave(last,REASON_EFFECT) else
	Duel.MoveToField(last,bc:GetControler(),bc:GetControler(),LOCATION_SZONE,POS_FACEUP,true) end
	damage=damage+1 end
	if bc:GetOverlayCount()==0 and bc:IsLocation(LOCATION_MZONE) then Cookie3.Cookiedestroyop(e,tp,eg,ep,ev,re,r,rp,bc) end
	if bc:IsSetCard(0xd15) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,bc) end
	if bc:IsSetCard(0xd04) and bc:IsLocation(LOCATION_MZONE) then Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,bc) end
	if c:IsSetCard(0xd03) then return Cookie6.AndCoookieEffect(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount) end
	if c:IsSetCard(0xd031) then return Cookie6.AndCoookieEffect2(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount) end
end

--쿠키 배틀 마나코스트
function Cookie2.battlemanacost(attr,colorCount,mixCount)
	return function(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ATTACK_COST)

	e1:SetCost(function(e,c,tp)
	local _mixCount=mixCount
	local _colorCount=colorCount
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally:IsCode(10060000) then return true end
	--백면사(10068075)
	if Duel.IsExistingMatchingCard(Card.IsCode,tp,LOCATION_SZONE,LOCATION_SZONE,1,nil,10068075)
	and Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)>=6 then _mixCount=_mixCount+1 end
	--이터널슈가 쿠키(10090049)
	local brk=Duel.GetMatchingGroup(Card.IsFaceup,tp,0,LOCATION_EXTRA,nil):GetSum(Card.GetLevel)
	local esn=Duel.GetMatchingGroupCount(Card.IsCode,tp,0,LOCATION_MZONE,nil,table.unpack(CARD_ETERNAL_SUGAR))
	local ls=Duel.GetMatchingGroupCount(Card.IsCode,tp,0,LOCATION_MZONE,nil,10090049)
	if brk>=5 and esn==1 and ls==1 then _mixCount=_mixCount+1 end
	--결의와 품위가 살아 숨쉬는 시대(10068125)
	if Duel.IsExistingMatchingCard(Card.IsCode,tp,LOCATION_SZONE,LOCATION_SZONE,1,nil,10068125)
	and Duel.GetFieldGroupCount(tp,LOCATION_GRAVE,0)>=15
	and e:GetHandler():IsCode(table.unpack(CARD_DARK_CACAO)) then
	if _colorCount>0 then _colorCount=_colorCount-1
	_mixCount=_mixCount-1 end end
	--0xd16 공격 코스트 감소
	if e:GetHandler():IsSetCard(0xd16) and e:GetHandler():IsAttribute(ATTRIBUTE_FIRE) then
	if _colorCount>0 then _colorCount=_colorCount-1 _mixCount=_mixCount-1 end end
	--푸룬주스맛쿠키(10067104) 공격 코스트 믹스
	if e:GetHandler():IsSetCard(0xa11) then _colorCount=0 end
	--소르베맛쿠키(10068084)
	local sherbet=Duel.GetMatchingGroupCount(Cookie2.sherbetfilter,tp,0,LOCATION_MZONE,nil,tp)
	local g=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_REMOVED,0,nil)
	return #g>=_mixCount
	and aux.SelectUnselectGroup(g,e,tp,_mixCount,_mixCount,Cookie3.hasColorCount(attr,_colorCount),0)
	and Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)>=sherbet
	end)

	e1:SetOperation(function (e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local _mixCount=mixCount
	local _colorCount=colorCount
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally:IsCode(10060000) then return Duel.ChangePosition(c,POS_FACEUP_DEFENSE) and Duel.AttackCostPaid() end
	--백면사(10068075)
	if Duel.IsExistingMatchingCard(Card.IsCode,tp,LOCATION_SZONE,LOCATION_SZONE,1,nil,10068075)
	and Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)>=6 then _mixCount=_mixCount+1 end
	--이터널슈가 쿠키(10090049)
	local brk=Duel.GetMatchingGroup(Card.IsFaceup,tp,0,LOCATION_EXTRA,nil):GetSum(Card.GetLevel)
	local esn=Duel.GetMatchingGroupCount(Card.IsCode,tp,0,LOCATION_MZONE,nil,table.unpack(CARD_ETERNAL_SUGAR))
	local ls=Duel.GetMatchingGroupCount(Card.IsCode,tp,0,LOCATION_MZONE,nil,10090049)
	if brk>=5 and esn==1 and ls==1 then _mixCount=_mixCount+1 end
	--결의와 품위가 살아 숨쉬는 시대(10068125)
	if Duel.IsExistingMatchingCard(Card.IsCode,tp,LOCATION_SZONE,LOCATION_SZONE,1,nil,10068125)
	and Duel.GetFieldGroupCount(tp,LOCATION_GRAVE,0)>=15
	and (c:IsCode(table.unpack(CARD_DARK_CACAO))) then
	if _colorCount>0 then _colorCount=_colorCount-1 _mixCount=_mixCount-1 end end
	--0xd16 공격 코스트 감소
	if c:IsSetCard(0xd16) and c:IsAttribute(ATTRIBUTE_FIRE) then
	if _colorCount>0 then _colorCount=_colorCount-1 _mixCount=_mixCount-1 end end
	--푸룬주스맛쿠키(10067104) 공격 코스트 믹스
	if c:IsSetCard(0xa11) then _colorCount=0 end
	--소르베맛쿠키(10068084)
	local sherbet=Duel.GetMatchingGroupCount(Cookie2.sherbetfilter,tp,0,LOCATION_MZONE,nil,tp)
	if sherbet>0 then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,4))
	local hg=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,sherbet,sherbet,nil)
	if #hg>0 then Duel.SendtoGrave(hg,REASON_RULE) end end
		if c:IsLocation(LOCATION_MZONE) then
		local g=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_REMOVED,0,nil)
		local tg=aux.SelectUnselectGroup(g,e,tp,_mixCount,_mixCount,Cookie3.hasColorCount(attr,_colorCount),1,tp,aux.Stringid(10060000,4))
		local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
		Duel.Overlay(ally,tg)
		Duel.ChangePosition(c,POS_FACEUP_DEFENSE)
		Duel.AttackCostPaid() end
end)
	c:RegisterEffect(e1) end
end
function Cookie2.sherbetfilter(c)
	return c:IsCode(10068084) and c:IsDefensePos()
end