local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,0,0)
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
	and tc:GetPreviousControler()==tp then
	Duel.RegisterFlagEffect(tp,id,RESET_PHASE+PHASE_END,0,1) end end
end
function s.attackposcookiefilter(c,tp)
	return c:IsAttackPos() and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.cookiefilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Itemcost(e,tp,eg,ep,ev,re,r,rp,chk)
	if Duel.GetFlagEffect(tp,id)>0 then
	decopencon=Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_WIND,0,1)
	else decopencon=Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_WIND,1,1) end
	return decopencon and Duel.GetMatchingGroupCount(s.attackposcookiefilter,tp,LOCATION_MZONE,0,nil,tp)>=1
end
function s.Itemcostoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetFlagEffect(tp,id)>0 then
	decopencost=Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WIND,0,1)
	else decopencost=Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WIND,1,1) end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.attackposcookiefilter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	Duel.ChangePosition(g,POS_FACEUP_DEFENSE)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.cookiefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,ag,1)
end