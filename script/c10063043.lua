local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_LIGHT,1,1)
end
function s.goldcheesecookiefilter(c,tp)
	return c:IsCode(10063025,10068026,10068027) and Cookie3.NoEmFzonefilter(c,tp)
	and not c:GetEquipGroup():IsExists(Card.IsSetCard,1,nil,0xc03)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local g=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)
	Cookie7.doubledamageeff(e,tp,eg,ep,ev,re,r,rp,g,1,1)
	if Duel.GetMatchingGroupCount(s.goldcheesecookiefilter,tp,LOCATION_MZONE,0,nil,tp)>=1
	and Duel.SelectYesNo(tp,aux.Stringid(10061004,1)) then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local hg=Duel.SelectMatchingCard(tp,s.goldcheesecookiefilter,tp,LOCATION_MZONE,0,1,1,nil,tp):GetFirst()
		Duel.Equip(tp,c,hg)
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_EQUIP_LIMIT)
		e1:SetReset(RESET_EVENT+RESETS_STANDARD)
		e1:SetValue(function(e,c) return c==e:GetLabelObject() end)
		e1:SetLabelObject(hg)
		c:RegisterEffect(e1)
		Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,hg,2)
	end
end