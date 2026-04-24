local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_LIGHT,1,1,0,0)
end
if not s.global_check then
	s.global_check=true
	local ge1=Effect.GlobalEffect()
	ge1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	ge1:SetCode(EVENT_TO_GRAVE)
	ge1:SetOperation(s.checkop)
	Duel.RegisterEffect(ge1,0)
end
function s.checkop(e,tp,eg,ep,ev,re,r,rp)
	for tc in aux.Next(eg) do
		local p=tc:GetPreviousControler()
		if tc:IsPreviousLocation(LOCATION_EXTRA) and tc:GetLevel()==3 and tc:IsAttribute(ATTRIBUTE_LIGHT)
		and tc:IsRace(RACE_WARRIOR) then Duel.RegisterFlagEffect(p,id+tc:GetCode(),RESET_PHASE+PHASE_END,0,1) end
	end
end
function s.lv3filter(c,tp)
	return c:GetLevel()==3 and c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsRace(RACE_WARRIOR)
	and c:IsLocation(LOCATION_GRAVE) and Duel.GetFlagEffect(tp,id+c:GetCode())>0
end
function s.Stageeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.lv3filter,tp,LOCATION_GRAVE,0,1,nil,tp)
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.lv3filter,tp,LOCATION_GRAVE,0,0,1,nil,tp)
	if #ag>0 then
		local tc=ag:GetFirst()
		Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,tc,1)
		if tc:GetOverlayCount()==2 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,tc,1) end	end
end