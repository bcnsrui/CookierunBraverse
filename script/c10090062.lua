if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_WIND,2,2)
end
function s.greenmana(c)
	return c:IsAttribute(ATTRIBUTE_WIND)
end
function s.TrapCost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0):FilterCount(s.greenmana,nil)>=1
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local tg=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #tg==0 then return end
	local tc=tg:GetFirst()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0):FilterSelect(tp,s.greenmana,0,1,nil)
	if #sg>0 then Duel.SendtoDeck(sg,nil,SEQ_DECKTOP,REASON_EFFECT)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,tc,1) end
end