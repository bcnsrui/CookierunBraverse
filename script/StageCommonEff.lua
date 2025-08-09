--스테이지는 실력이다
Cookie5={}

--스테이지 유틸
function Cookie5.Stagesetting(attr,colorCount,mixCount)
	return function(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(Cookie3.Battleskillcon)
	e1:SetTarget(function(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,attr,colorCount,mixCount) end
	Duel.SetChainLimit(aux.FALSE) end)
	e1:SetOperation(function(e,tp,eg,ep,ev,re,r,rp)
	local fc=Duel.GetFieldCard(tp, LOCATION_FZONE, 0)
	if fc then Duel.SendtoGrave(fc,REASON_RULE)
	Duel.BreakEffect() end
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,attr,colorCount,mixCount)
	Duel.MoveToField(e:GetHandler(),tp,tp,LOCATION_FZONE,POS_FACEUP,true) end)
	c:RegisterEffect(e1)
	end
end