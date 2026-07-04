if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ALL_COLOR,0,4)
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_QUICK_O)
	e0:SetCode(EVENT_FREE_CHAIN)
	e0:SetRange(LOCATION_EXTRA)
	e0:SetCondition(s.Summoncon)
	e0:SetTarget(Cookie3.notg)
	e0:SetOperation(Cookie8.ExtraSummonop)
	c:RegisterEffect(e0)
end
function s.breaklv(tp)
	return Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)
end
function s.Summoncon(e)
	local tp=e:GetHandlerPlayer()
	return Cookie8.ExtraSummoncon(e) and s.breaklv(tp)>=6 and s.breaklv(1-tp)>=6
	and Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=3
	and Duel.GetFieldGroupCount(1-tp,LOCATION_HAND,0)<=3
end