local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WIND,1,1,0,0)
	aux.GlobalCheck(s,function()
		local ge1=Effect.CreateEffect(c)
		ge1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		ge1:SetCode(EVENT_TO_HAND)
		ge1:SetOperation(s.checkop)
		Duel.RegisterEffect(ge1,0)
		local ge2=ge1:Clone()
		ge2:SetCode(EVENT_TO_DECK)
		Duel.RegisterEffect(ge2,0)
		local ge3=ge1:Clone()
		ge3:SetCode(EVENT_MOVE)
		ge3:SetOperation(s.checkop1)
		Duel.RegisterEffect(ge3,0)
	end)
end
function s.checkop(e,tp,eg,ep,ev,re,r,rp)
	for tc in aux.Next(eg) do
		if tc:IsPreviousLocation(LOCATION_REMOVED) then Duel.RegisterFlagEffect(tp,id,RESET_PHASE|PHASE_END,0,1) end
	end
end
function s.checkop1(e,tp,eg,ep,ev,re,r,rp)
	for tc in aux.Next(eg) do
		if tc:IsPreviousLocation(LOCATION_REMOVED) and tc:IsLocation(LOCATION_GRAVE) then
		Duel.RegisterFlagEffect(tp,id,RESET_PHASE|PHASE_END,0,1) end
	end
end
function s.Stagecost(e,tp,eg,ep,ev,re,r,rp,chk)
	local g=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,1,0,0)
	if chk==0 then return #g>0 end
end
function s.Stageeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFlagEffect(tp,id)~=0
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,1,0,0)
	if #g>0 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local tc=g:Select(tp,1,1,nil)
		Duel.Remove(tc,POS_FACEUP,REASON_EFFECT)
	end
end