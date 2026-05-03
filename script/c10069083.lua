if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,3,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WATER,0,0)
	if not s.global_check then
		s.global_check=true
		local ge1=Effect.CreateEffect(c)
		ge1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		ge1:SetCode(EVENT_MOVE)
		ge1:SetOperation(s.checkop)
		Duel.RegisterEffect(ge1,0)
	end
end
function s.deck_top_or_bottom(tc)
	if not tc:IsLocation(LOCATION_DECK) then return false end
	local cp=tc:GetControler()
	local dc=Duel.GetFieldGroupCount(cp,LOCATION_DECK,cp)
	if dc==0 then return false end
	local seq=tc:GetSequence()
	return seq==0 or seq==dc-1
end
function s.checkop(e,tp,eg,ep,ev,re,r,rp)
	for tc in aux.Next(eg) do
	if s.deck_top_or_bottom(tc) and tc:IsRace(RACE_WARRIOR)
	and (tc:IsPreviousLocation(LOCATION_MZONE) or tc:IsPreviousLocation(LOCATION_EXTRA)) then
	local p=tc:GetPreviousControler()
	if p==nil or p>1 then p=tc:GetOwner() end
	if p==0 or p==1 then Duel.RegisterFlagEffect(p,id,RESET_PHASE+PHASE_END,0,1) end end end
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFlagEffect(tp,id)>=1
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local n=Duel.AnnounceNumber(tp,1,0)
	if n==0 then return end
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,n)
end