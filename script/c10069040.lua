if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_LIGHT,1,1)
end
function s.flipcookie(c)
	return c:IsRace(RACE_WARRIOR) and c:IsSetCard(0xb00)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.DisableShuffleCheck()
	local dt=Duel.GetDecktopGroup(tp,1)
	if #dt==0 then return end
	local tc=dt:GetFirst()
	Duel.ConfirmCards(1-tp,dt)
	if s.flipcookie(tc) then
	local draw=Duel.AnnounceNumber(tp,1,0)
	if draw>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,draw) end end
end