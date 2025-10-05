local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ESCookieEffect(c,ATTRIBUTE_LIGHT,2,3)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil)
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1)
end