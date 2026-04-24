local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WIND,2,2,3,3)
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #ag==0 then return end
	local tc=ag:GetFirst()
	local supportarea=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local greencards=supportarea:FilterSelect(tp,Card.IsAttribute,0,1,nil,ATTRIBUTE_WIND)
	if #greencards>0 then
		Duel.SendtoDeck(greencards,nil,SEQ_DECKTOP,REASON_EFFECT)
		Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,tc,1)
	end
end
