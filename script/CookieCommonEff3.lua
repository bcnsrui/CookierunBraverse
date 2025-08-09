--쿠키런 브레이버스의 공통적인 임플란트3
Cookie8={}
LOCATION_TRIGGERZONE=LOCATION_MZONE+LOCATION_GRAVE+LOCATION_EXTRA

--라벨 탐색
function Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,cg)
	local c=e:GetHandler()
	local max_val=0
	local g=Duel.GetMatchingGroup(Card.IsSetCard,tp,LOCATION_TRIGGERZONE,LOCATION_TRIGGERZONE,nil,0xc01)
	for tc in aux.Next(g) do
		local val=tc:GetTurnCounter()
		if val and val>max_val then max_val=val end end
	local typ=type(cg)
	if typ=="Card" then cg:SetTurnCounter(max_val+1)
	elseif typ=="Group" then for tc2 in aux.Next(cg) do tc2:SetTurnCounter(max_val+1) end end
end

function Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
	e:GetHandler():SetTurnCounter(0)
end

function Cookie8.eventcon(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local my_val=c:GetTurnCounter()
	if my_val<1 then return false end
	if not my_val then return false end
	local g=Duel.GetMatchingGroup(Card.IsSetCard,tp,LOCATION_TRIGGERZONE,LOCATION_TRIGGERZONE,nil,0xc01)
	for tc in aux.Next(g) do
		if tc~=c then
		local val=tc:GetTurnCounter()
		if val and val>my_val then return false end end end
	return true
end