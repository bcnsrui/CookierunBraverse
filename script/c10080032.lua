if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ALL_COLOR,5,5,1,1)
end
function s.ancientfilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp) and c:IsSetCard(0xa04)
end
function s.Stagecost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ALL_COLOR,0,2) end
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,0,2)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.ancientfilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #ag>0 then
		local tc=ag:GetFirst()
		local e1=Effect.CreateEffect(e:GetHandler())
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_ATTACK_COST)
		e1:SetCost(function(e2,c2,tp2)
			local g=Duel.GetMatchingGroup(Card.IsFaceup,tp2,LOCATION_REMOVED,0,nil)
			local mixTotal=c2:GetLevel()
			return #g>=mixTotal and aux.SelectUnselectGroup(g,e2,tp2,mixTotal,mixTotal,aux.TRUE,0)
		end)
		e1:SetOperation(function(e2,tp2,eg2,ep2,ev2,re2,r2,rp2)
			local c2=e2:GetHandler()
			if c2:IsLocation(LOCATION_MZONE) then
				local g=Duel.GetMatchingGroup(Card.IsFaceup,tp2,LOCATION_REMOVED,0,nil)
				local mixTotal=c2:GetLevel()
				local tg=aux.SelectUnselectGroup(g,e2,tp2,mixTotal,mixTotal,aux.TRUE,1,tp2,aux.Stringid(10060000,4))
				local ally=Duel.GetMatchingGroup(nil,tp2,LOCATION_EMZONE,0,nil):GetFirst()
				Duel.Overlay(ally,tg)
				Duel.ChangePosition(c2,POS_FACEUP_DEFENSE)
				Duel.AttackCostPaid()
			end
		end)
		e1:SetReset(RESET_PHASE+PHASE_END)
		tc:RegisterEffect(e1)
	end
end
