local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_LIGHT,1,1)
	if not s.global_check then s.global_check=true
		local ge1=Effect.CreateEffect(c)
		ge1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		ge1:SetCode(EVENT_DESTROYED)
		ge1:SetOperation(s.check)
		Duel.RegisterEffect(ge1,0)
	end
end
function s.check(e,tp,eg,ep,ev,re,r,rp)
	for tc in aux.Next(eg) do
	if tc:IsPreviousLocation(LOCATION_MZONE) and tc:IsLocation(LOCATION_EXTRA)
	and tc:GetPreviousControler()==1-tp then
	Duel.RegisterFlagEffect(tp,id,RESET_PHASE+PHASE_END,0,1) end end
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFlagEffect(tp,id)>0
end
function s.lv1cookiefilter(c)
	return c:IsLevel(1) and c:IsRace(RACE_WARRIOR)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.lv1cookiefilter,tp,LOCATION_EXTRA,0,0,1,nil)
	Duel.SendtoGrave(ag,REASON_EFFECT)
end