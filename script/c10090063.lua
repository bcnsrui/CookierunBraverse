if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_WIND,1,1)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)>=7
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	local g1=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local g2=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)
	if #g1==0 or #g2==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg1=g1:Select(tp,1,1,nil)
	Duel.Hint(HINT_SELECTMSG,1-tp,aux.Stringid(10060001,1))
	local sg2=g2:Select(1-tp,1,1,nil)
	Duel.SendtoGrave(sg1,REASON_EFFECT)
	Duel.SendtoGrave(sg2,REASON_EFFECT)
end