if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WIND,2,2,2,2)
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
end
function s.Stageeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)>=5
	and Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,0,1,0)>0
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local enemyactivemana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,0,1,0)
	if #enemyactivemana>0 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local ag=enemyactivemana:Select(tp,0,1,nil)
		if #ag>0 then
			local enemy=Duel.GetMatchingGroup(nil,1-tp,LOCATION_EMZONE,0,nil):GetFirst()
			if enemy then
				Duel.Overlay(enemy,ag)
			end
		end
	end
end