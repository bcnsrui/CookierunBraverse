if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_DARK,1,1,0,0)
end
function s.lv1purplefilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsAttribute(ATTRIBUTE_DARK) and c:IsLevel(1) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(s.lv1purplefilter,tp,LOCATION_MZONE,0,nil,tp)
	if #g==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local tg=g:Select(tp,0,1,nil)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,tg)
end