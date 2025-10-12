local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_WIND,3,3)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)>=1
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #ag>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,ag,-2) end
	local mana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	if #mana>=7 and Duel.GetFieldGroupCount(1-tp,LOCATION_REMOVED,0)>0 then
	Duel.Hint(HINT_SELECTMSG,1-tp,aux.Stringid(10060001,1))
	local enemy=Duel.GetMatchingGroup(nil,tp,0,LOCATION_EMZONE,nil):GetFirst()
	Duel.Hint(HINT_SELECTMSG,1-tp,aux.Stringid(10060001,1))
	local activeg=Duel.SelectMatchingCard(tp,Card.IsFaceup,1-tp,LOCATION_REMOVED,0,1,1,nil)
	Duel.Overlay(enemy,activeg) end
end