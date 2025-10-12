local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_WIND,0,0)
end
function s.Trapcost(e,tp,eg,ep,ev,re,r,rp,chk)
	local allymana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local enemymana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)
	return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_WIND,1,1) or #allymana+2<=#enemymana
end
function s.Trapcostoperation(e,tp,eg,ep,ev,re,r,rp)
	local cost1=Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ATTRIBUTE_LIGHT,1,1)
	local allymana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local enemymana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)
	if #allymana+2<=#enemymana then return true
	else Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,1,1) end
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #ag>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,ag,-1) end
end