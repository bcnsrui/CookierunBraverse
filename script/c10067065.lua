if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WIND,1,1,0,0)
end
function s.arenacookiefilter(c)
	return c:IsRace(RACE_WARRIOR) and c:IsSetCard(0xc01)
end
function s.Stageeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local g=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0):Filter(s.arenacookiefilter,nil)
	return #g>0 and Duel.GetFieldGroupCount(tp,LOCATION_MZONE,0)>0
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local mana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0):Filter(s.arenacookiefilter,nil)
	if #mana>0 then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local arenacookies=mana:Select(tp,0,1,nil)
	if #arenacookies>0 then
	Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,arenacookies)
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,8)) then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end	end end
end