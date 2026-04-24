if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_LIGHT,2,2,1,1)
end
function s.hp1filter(c,tp)
	return c:GetOverlayCount()==1 and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Stageeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.hp1filter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.hp1filter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #ag>0 then
		local tc=ag:GetFirst()
		Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,tc,1)	end
end
