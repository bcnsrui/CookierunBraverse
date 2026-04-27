--쿠키런 브레이버스의 공통적인 임플란트3
Cookie8={}
LOCATION_TRIGGERZONE=LOCATION_MZONE+LOCATION_GRAVE+LOCATION_EXTRA+LOCATION_FZONE

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