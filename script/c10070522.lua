local s,id=GetID()
function s.initial_effect(c)
	local Stagesetting=Cookie5.Stagesetting(ATTRIBUTE_DARK,1,1)
	Stagesetting(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e1:SetCode(EVENT_CUSTOM+10060100)
	e1:SetRange(LOCATION_FZONE)
	e1:SetCondition(Cookie8.eventcon)
	e1:SetTarget(Cookie3.eventtg)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
    local c=e:GetHandler()
    Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
    if c:GetFlagEffect(id)>0 then return end
    if not Duel.SelectYesNo(tp,aux.Stringid(10060001,8)) then return end
    c:RegisterFlagEffect(id,RESETS_STANDARD_PHASE_END|RESET_OPPO_TURN,0,1)
    Duel.Draw(tp,1,REASON_EFFECT)
    Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
end