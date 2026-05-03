if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_LIGHT,1,1)
end
function s.yellow_lv3(c,tp)
	return c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsRace(RACE_WARRIOR) and c:IsLevel(3) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.eternal_equip(c,tp)
	return c:IsCode(table.unpack(CARD_ETERNAL_SUGAR)) and Cookie3.NoEmFzonefilter(c,tp)
	and not c:GetEquipGroup():IsExists(Card.IsSetCard,1,nil,0xc03)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.yellow_lv3,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #g>0 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,g,1) end
	if Duel.IsExistingMatchingCard(s.eternal_equip,tp,LOCATION_MZONE,0,1,nil,tp)
	and Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ATTRIBUTE_LIGHT,1,1)
	and Duel.SelectYesNo(tp,aux.Stringid(10061004,1)) then
		Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,1,1)
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local hg=Duel.SelectMatchingCard(tp,s.eternal_equip,tp,LOCATION_MZONE,0,1,1,nil,tp):GetFirst()
		if not hg then return end
		Duel.Equip(tp,c,hg)
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_EQUIP_LIMIT)
		e1:SetReset(RESET_EVENT+RESETS_STANDARD)
		e1:SetValue(function(e,c) return c==e:GetLabelObject() end)
		e1:SetLabelObject(hg)
		c:RegisterEffect(e1)
		local e2=Effect.CreateEffect(hg)
		e2:SetType(EFFECT_TYPE_SINGLE)
		e2:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
		e2:SetRange(LOCATION_MZONE)
		e2:SetCode(EFFECT_IMMUNE_EFFECT)
		e2:SetValue(function(e,re)
			local rc=re:GetHandler()
			return rc and rc:IsRace(RACE_FAIRY) and rc:GetOwner()~=e:GetHandlerPlayer()
		end)
		e2:SetReset(RESET_EVENT+RESETS_STANDARD)
		hg:RegisterEffect(e2)
	end
end