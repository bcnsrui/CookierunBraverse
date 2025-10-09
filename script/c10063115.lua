local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_DARK,3,3)
end
function s.lv2cookiefilter(c,tp)
	return c:IsLevelBelow(2) and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.darkcacaocookiefilter(c,tp)
	return c:IsCode(10063100,10068103,10068104) and Cookie3.NoEmFzonefilter(c,tp)
	and not c:GetEquipGroup():IsExists(Card.IsSetCard,1,nil,0xc03)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.lv2cookiefilter,tp,0,LOCATION_MZONE,0,2,nil,tp)
	for tc in g:Iter() do Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,tc,1) end
	if Duel.GetMatchingGroupCount(s.darkcacaocookiefilter,tp,LOCATION_MZONE,0,nil,tp)>=1
	and Duel.SelectYesNo(tp,aux.Stringid(10061004,1)) then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local hg=Duel.SelectMatchingCard(tp,s.darkcacaocookiefilter,tp,LOCATION_MZONE,0,1,1,nil,tp):GetFirst()
		Duel.Equip(tp,c,hg)
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_EQUIP_LIMIT)
		e1:SetReset(RESET_EVENT+RESETS_STANDARD)
		e1:SetValue(function(e,c) return c==e:GetLabelObject() end)
		e1:SetLabelObject(hg)
		c:RegisterEffect(e1)
		local e2=Effect.CreateEffect(c)
		e2:SetType(EFFECT_TYPE_SINGLE)
		e2:SetCode(EFFECT_ADD_SETCODE)
		e2:SetValue(0xa05)
		e2:SetReset(RESET_EVENT+RESETS_STANDARD)
		hg:RegisterEffect(e2)
		local e3=Effect.CreateEffect(c)
		e3:SetDescription(aux.Stringid(id,0))
		e3:SetType(EFFECT_TYPE_SINGLE)
		e3:SetProperty(EFFECT_FLAG_CLIENT_HINT+EFFECT_FLAG_CANNOT_DISABLE)
		e3:SetReset(RESET_EVENT+RESETS_STANDARD)
		hg:RegisterEffect(e3)
	end
end