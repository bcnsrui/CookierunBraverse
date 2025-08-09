--쿠키의 효과처리 타입
Cookie6={}

--스킬없음
function Cookie6.NSCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c)
	Cookie2.battlemanacost(attr,colorCount,mixCount)(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xc00)
	c:RegisterEffect(e1)
end

--1등장시
function Cookie6.SSCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c)
	Cookie2.battlemanacost(attr,colorCount,mixCount)(c)
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_SINGLE)
	e3:SetCode(EFFECT_ADD_SETCODE)
	e3:SetValue(0xc01)
	c:RegisterEffect(e3)
	local e4=Effect.CreateEffect(c)
	e4:SetType(EFFECT_TYPE_SINGLE)
	e4:SetCode(EFFECT_ADD_SETCODE)
	e4:SetValue(0xc02)
	c:RegisterEffect(e4)
	local e1=Effect.CreateEffect(c)
	Cookie6.summonsuccess(e1)
	return e1
end
function Cookie6.summonsuccess(e)
	e:SetDescription(aux.Stringid(10060000,5))
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e:SetProperty(EFFECT_FLAG_NO_TURN_RESET)
	e:SetCode(EVENT_CUSTOM+10060100)
	e:SetRange(LOCATION_MZONE)
	e:SetCountLimit(1)
	e:SetCondition(Cookie8.eventcon)
	e:SetTarget(Cookie3.eventtg)
end

--2기동
function Cookie6.ISCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c)
	Cookie2.battlemanacost(attr,colorCount,mixCount)(c)
	local e1=Effect.CreateEffect(c)
	Cookie6.ignition(e1)
	return e1
end
function Cookie6.ignition(e)
	e:SetDescription(aux.Stringid(10060000,5))
	e:SetType(EFFECT_TYPE_QUICK_O)
	e:SetCode(EVENT_FREE_CHAIN)
	e:SetRange(LOCATION_MZONE)
	e:SetCondition(Cookie3.Battleskillcon)
end

--3지속
function Cookie6.CSCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c)
	Cookie2.battlemanacost(attr,colorCount,mixCount)(c)
	local e1=Effect.CreateEffect(c)
	Cookie6.Continuous(e1)
	return e1
end
function Cookie6.Continuous(e)
	e:SetType(EFFECT_TYPE_SINGLE)
	e:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e:SetRange(LOCATION_MZONE)
end

--4그리고
function Cookie6.ASCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c)
	Cookie2.battlemanacost(attr,colorCount,mixCount)(c)
end

--5블로커+공격했을때
function Cookie6.BSCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c)
	Cookie2.battlemanacost(attr,colorCount,mixCount)(c)
	local e1=Effect.CreateEffect(c)
	Cookie6.Blocker(e1)
	return e1
end
function Cookie6.Blocker(e)
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_O)
	e:SetCode(EVENT_ATTACK_ANNOUNCE)
	e:SetRange(LOCATION_MZONE)
end

--6기절
function Cookie6.ESCookieEffect(c,attr,colorCount,mixCount)
	Cookie2.CookieCharacter(c)
	Cookie2.battlemanacost(attr,colorCount,mixCount)(c)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xc01)
	c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_SINGLE)
	e3:SetCode(EFFECT_ADD_SETCODE)
	e3:SetValue(0xc03)
	c:RegisterEffect(e3)
	local e1=Effect.CreateEffect(c)
	Cookie6.extrasuccess(e1)
	return e1
end
function Cookie6.extrasuccess(e)
	e:SetDescription(aux.Stringid(10060000,5))
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e:SetProperty(EFFECT_FLAG_NO_TURN_RESET)
	e:SetCode(EVENT_CUSTOM+10060100)
	e:SetRange(LOCATION_EXTRA)
	e:SetCountLimit(1)
	e:SetCondition(Cookie8.eventcon)
	e:SetTarget(Cookie3.eventtg)
end

--I아이템
function Cookie6.ItemEffect(c)
	local e1=Effect.CreateEffect(c)
	Cookie6.Itemeff(e1)
	return e1
end
function Cookie6.Itemeff(e)
	e:SetType(EFFECT_TYPE_QUICK_O)
	e:SetCode(EVENT_FREE_CHAIN)
	e:SetRange(LOCATION_HAND)
	e:SetCondition(Cookie3.Battleskillcon)
	e:SetCost(Cost.SelfToGrave)
end

--T트랩
function Cookie6.TrapEffect(c)
	local e1=Effect.CreateEffect(c)
	Cookie6.Trapeff(e1)
	return e1
end
function Cookie6.Trapeff(e)
	e:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_O)
	e:SetCode(EVENT_ATTACK_ANNOUNCE)
	e:SetRange(LOCATION_HAND)
	e:SetCondition(function(_,tp) return Duel.GetTurnPlayer()~=tp end)
	e:SetCost(Cost.SelfToGrave)
end

--S스테이지
function Cookie6.StageEffect(c,attr,colorCount,mixCount)
	local Stagesetting=Cookie5.Stagesetting(attr,colorCount,mixCount)
	Stagesetting(c)
	local e1=Effect.CreateEffect(c)
	Cookie6.stageeff(e1)
	return e1
end
function Cookie6.stageeff(e)
	e:SetDescription(aux.Stringid(10060000,5))
	e:SetType(EFFECT_TYPE_QUICK_O)
	e:SetCode(EVENT_FREE_CHAIN)
	e:SetRange(LOCATION_FZONE)
	e:SetCondition(Cookie3.Battleskillcon)
end