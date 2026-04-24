if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
local COUNT_ID=id+1000

function s.desfilter(c,tp)
	return c:IsPreviousLocation(LOCATION_MZONE) and c:IsPreviousControler(1-tp)
		and c:IsReason(REASON_DESTROY) and c:IsRace(RACE_WARRIOR)
end
function s.countcon(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetTurnPlayer()==tp and eg:IsExists(s.desfilter,1,nil,tp)
end
function s.countop(e,tp,eg,ep,ev,re,r,rp)
	for tc in aux.Next(eg) do
		if s.desfilter(tc,tp) then Duel.RegisterFlagEffect(tp,COUNT_ID,RESET_PHASE|PHASE_END,0,1) end
	end
end

function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WATER,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e1:SetCode(EVENT_DESTROYED)
	e1:SetRange(LOCATION_HAND)
	e1:SetCondition(s.countcon)
	e1:SetOperation(s.countop)
	e1:SetReset(RESET_PHASE+PHASE_END)
	c:RegisterEffect(e1)
end

function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFlagEffect(tp,COUNT_ID)>0
end

function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local ct=Duel.GetFlagEffect(tp,COUNT_ID)
	if ct<=0 then return end
	if ct>5 then ct=5 end
	local count
	if ct==1 then
		count=Duel.AnnounceNumber(tp,1,0)
	elseif ct==2 then
		count=Duel.AnnounceNumber(tp,2,1,0)
	elseif ct==3 then
		count=Duel.AnnounceNumber(tp,3,2,1,0)
	elseif ct==4 then
		count=Duel.AnnounceNumber(tp,4,3,2,1,0)
	else
		count=Duel.AnnounceNumber(tp,5,4,3,2,1,0)
	end
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count)
end