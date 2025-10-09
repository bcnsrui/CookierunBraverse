local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,3,3)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,13))
	local sel=Duel.SelectOption(tp,aux.Stringid(id,0),aux.Stringid(id,1))+1
	if sel==1 then
		local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
		Duel.Overlay(ally,c)
	elseif sel==2 then
		local g=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)
		Cookie7.doubledamageeff(e,tp,eg,ep,ev,re,r,rp,g,1,1)
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local supportarea=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
		local mana=supportarea:Select(tp,2,2,nil)
		Duel.SendtoGrave(mana,REASON_EFFECT) end
end