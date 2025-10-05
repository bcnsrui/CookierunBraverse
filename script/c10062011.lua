local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ISCookieEffect(c,ATTRIBUTE_LIGHT,2,3)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.rescon(sg,e,tp,mg,c)
	local sum=sg:GetSum(Card.GetLevel)
	return sum==3
end
function s.filter(c)
	return c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsLocation(LOCATION_EXTRA)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then
		local g=Duel.GetMatchingGroup(s.filter,tp,LOCATION_EXTRA,0,nil)
		return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_LIGHT,2,2) and
		aux.SelectUnselectGroup(g,e,tp,1,#g,s.rescon,0)
	end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,2,2)
	Duel.SendtoExtraP(e:GetHandler(),nil,REASON_EFFECT)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(id,0))
	local g=Duel.GetMatchingGroup(s.filter,tp,LOCATION_EXTRA,0,nil)
	local rg=aux.SelectUnselectGroup(g,e,tp,1,#g,s.rescon,1,tp,HINTMSG_SELECT,s.rescon,nil,false)
	if #rg>0 then
		Duel.SendtoHand(rg,nil,REASON_EFFECT)
	end
end