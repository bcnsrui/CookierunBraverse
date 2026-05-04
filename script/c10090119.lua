if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_DARK,1,1)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	return ally and ally:IsSetCard(0xa17)
end
function s.saltfilter(c,tp)
	return c:IsCode(table.unpack(CARD_SILENT_SALT)) and Cookie3.NoEmFzonefilter(c,tp)
		and not c:GetEquipGroup():IsExists(Card.IsSetCard,1,nil,0xc03)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1) end
	if Duel.IsExistingMatchingCard(s.saltfilter,tp,LOCATION_MZONE,0,1,nil,tp)
	and Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ATTRIBUTE_DARK,1,1)
	and Duel.SelectYesNo(tp,aux.Stringid(10061004,1)) then
		Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_DARK,1,1)
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local hg=Duel.SelectMatchingCard(tp,s.saltfilter,tp,LOCATION_MZONE,0,1,1,nil,tp):GetFirst()
		if not hg then return end
		Duel.Equip(tp,c,hg)
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_EQUIP_LIMIT)
		e1:SetReset(RESET_EVENT+RESETS_STANDARD)
		e1:SetValue(function(e,ec) return ec==e:GetLabelObject() end)
		e1:SetLabelObject(hg)
		c:RegisterEffect(e1)
		local e2=Effect.CreateEffect(c)
		e2:SetType(EFFECT_TYPE_EQUIP)
		e2:SetCode(EFFECT_UPDATE_ATTACK)
		e2:SetValue(1)
		e2:SetReset(RESET_EVENT+RESETS_STANDARD)
		c:RegisterEffect(e2) end
end