if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_LIGHT,1,1,0,0)
end
function s.lv3filter(c,tp)
	return c:GetLevel()==3 and c:IsRace(RACE_WARRIOR) and c:IsSetCard(0xa132)
end
function s.Stageeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.lv3filter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.GetMatchingGroup(s.lv3filter,tp,LOCATION_MZONE,0,nil,tp)
	if #ag>0 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,ag,1)
	if ag:GetFirst():GetOverlayCount()==2 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,ag,1) end	end
end