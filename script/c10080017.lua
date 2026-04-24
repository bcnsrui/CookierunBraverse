local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,1,2)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_WIND,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060000,7))
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e1:SetCode(EVENT_TO_GRAVE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCondition(s.trcon)
	e1:SetTarget(s.trtg)
	e1:SetOperation(s.trop)
	c:RegisterEffect(e1)
end
function s.cfilter(c,tp)
	return c:GetPreviousControler()==tp and (c:IsPreviousLocation(LOCATION_REMOVED) or c:IsPreviousLocation(LOCATION_OVERLAY))
end
function s.trcon(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetTurnPlayer()==tp and eg:IsExists(s.cfilter,1,nil,tp)
end
function s.trtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetChainLimit(aux.FALSE)
end
function s.trop(e,tp,eg,ep,ev,re,r,rp)
	Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler())
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if c:GetCounter(0x1001)>0 then return end
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if not ally then return end
	local dg=Duel.GetDecktopGroup(tp,1)
	if #dg>0 then Duel.Overlay(ally,dg) end
	c:AddCounter(0x1001,1)
end