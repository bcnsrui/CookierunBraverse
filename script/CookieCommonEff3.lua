--쿠키런 브레이버스의 공통적인 임플란트3
Cookie8={}
LOCATION_TRIGGERZONE=LOCATION_MZONE+LOCATION_GRAVE+LOCATION_EXTRA+LOCATION_FZONE

function Cookie8.IsSummonAppearanceQE(c)
	return c:IsSetCard(0xd011) or c:IsSetCard(0xd012) or c:IsSetCard(0xd013)
		or c:IsSetCard(0xd014) or c:IsSetCard(0xd015) or c:IsSetCard(0xd016)
end

function Cookie8.eventcon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local my_val=c:GetTurnCounter() or 0
	if my_val<1 then return false end
	local max_val=0
	local g=Duel.GetMatchingGroup(aux.TRUE,tp,LOCATION_TRIGGERZONE,LOCATION_TRIGGERZONE,nil)
	for tc in aux.Next(g) do
		local val=tc:GetTurnCounter() or 0
		if val>max_val then max_val=val end
	end
	return my_val==max_val
end

function Cookie8.eventcon2(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not Cookie8.IsSummonAppearanceQE(c) then return false end
	if not eg or not eg:IsContains(c) then return false end
	local my_val=c:GetTurnCounter() or 0
	if my_val<1 then return false end
	local max_val=0
	local g=Duel.GetMatchingGroup(aux.TRUE,tp,LOCATION_TRIGGERZONE,LOCATION_TRIGGERZONE,nil)
	for tc in aux.Next(g) do
		local val=tc:GetTurnCounter() or 0
		if val>max_val then max_val=val end
	end
	return my_val==max_val
end

function Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,cg)
	local typcg=type(cg)
	if typcg=="Card" then
		if (cg:GetTurnCounter() or 0)>=1 then return end
	elseif typcg=="Group" then
		for tc in aux.Next(cg) do
			if (tc:GetTurnCounter() or 0)>=1 then return end
		end
	end
	local c=e:GetHandler()
	local max_val=0
	local g=Duel.GetMatchingGroup(aux.TRUE,tp,LOCATION_TRIGGERZONE,LOCATION_TRIGGERZONE,nil)
	for tc in aux.Next(g) do
		local val=tc:GetTurnCounter()
		if val and val>max_val then max_val=val end end
	local typ=type(cg)
	if typ=="Card" then cg:SetTurnCounter(max_val+1)
	elseif typ=="Group" then for tc2 in aux.Next(cg) do tc2:SetTurnCounter(max_val+1) end end
end

function Cookie8.eventop2(e,tp,eg,ep,ev,re,r,rp,cg)
	local turnp=Duel.GetTurnPlayer()
	local typ=type(cg)
	if typ=="Card" then
		if cg:GetControler()==turnp then cg:SetTurnCounter(2)
		else cg:SetTurnCounter(1) end
	elseif typ=="Group" then
		for tc in aux.Next(cg) do
			if tc:GetControler()==turnp then tc:SetTurnCounter(2)
			else tc:SetTurnCounter(1) end end end
end

function Cookie8.ExtraSummoncon(e)
	local tp=e:GetHandlerPlayer()
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	return Duel.GetLocationCount(tp,LOCATION_MZONE)>0 and Duel.GetTurnPlayer()==tp
	and Duel.GetCurrentPhase()==PHASE_BATTLE_STEP and Duel.GetCurrentChain()==0
	and not (Duel.GetAttacker() and Duel.GetAttacker():IsControler(tp) and ally:IsSetCard(0xa12))
end

function Cookie8.ExtraSummoncon2(e)
	local tp=e:GetHandlerPlayer()
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	return Duel.GetTurnPlayer()==tp and Duel.GetCurrentPhase()==PHASE_BATTLE_STEP and Duel.GetCurrentChain()==0
	and not (Duel.GetAttacker() and Duel.GetAttacker():IsControler(tp) and ally:IsSetCard(0xa12))
end

function Cookie8.ExtraSummonop(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler())
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xa12)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
	ally:RegisterEffect(e1)
end