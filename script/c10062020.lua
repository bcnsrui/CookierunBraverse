local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,2,2)
end
function s.hpcookiefilter(c,tp)
	return c:IsRace(RACE_WARRIOR) and c:IsAttribute(ATTRIBUTE_WIND) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.hpcookiefilter,tp,LOCATION_MZONE,0,nil,tp)>=1
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.hpcookiefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,g,1)
	local sg=Duel.GetFieldGroup(tp,LOCATION_GRAVE,0)
	last=sg:GetFirst()
	tc=sg:GetNext()
	for tc in aux.Next(sg) do
		if tc:GetSequence()>last:GetSequence() then last=tc end
	end
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	Duel.Overlay(ally,last)
end