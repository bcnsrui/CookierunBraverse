local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_FIRE,2,2)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local opts = {aux.Stringid(id,0)}
	local has_c02=Duel.GetMatchingGroupCount(Card.IsSetCard,tp,0,LOCATION_MZONE,nil,0xc02)>0
	if not has_c02 then
		table.insert(opts,aux.Stringid(id,1))
	end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10061003,13))
	local sel=Duel.SelectOption(tp,table.unpack(opts))+1
	if sel==1 then
		local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_ADD_SETCODE)
		e1:SetValue(0xa01)
		e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
		ally:RegisterEffect(e1)
		local e2=Effect.CreateEffect(c)
		e2:SetDescription(aux.Stringid(id,0))
		e2:SetType(EFFECT_TYPE_SINGLE)
		e2:SetProperty(EFFECT_FLAG_CLIENT_HINT+EFFECT_FLAG_CANNOT_DISABLE)
		e2:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
		ally:RegisterEffect(e2)
	elseif sel==2 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
		Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1)
	end
end