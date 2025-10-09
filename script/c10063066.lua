local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,3,3)
end
function s.saintlilycookiefilter(c,tp)
	return c:IsCode(10063055) and Cookie3.NoEmFzonefilter(c,tp)
	and not c:GetEquipGroup():IsExists(Card.IsSetCard,1,nil,0xc03)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local supportarea=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local mana=supportarea:Select(tp,1,1,nil)
	Duel.SendtoHand(mana,nil,REASON_EFFECT)
	Duel.ConfirmCards(1-tp,mana)
	Duel.ShuffleHand(tp)
	local tc=Duel.GetDecktopGroup(tp,1):GetFirst()
	if tc then Duel.Remove(tc,POS_FACEUP,REASON_EFFECT)	end
	if Duel.GetMatchingGroupCount(s.saintlilycookiefilter,tp,LOCATION_MZONE,0,nil,tp)>=1
	and Duel.SelectYesNo(tp,aux.Stringid(10061004,1)) then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local hg=Duel.SelectMatchingCard(tp,s.saintlilycookiefilter,tp,LOCATION_MZONE,0,1,1,nil,tp):GetFirst()
		Duel.Equip(tp,c,hg)
		local e1=Effect.CreateEffect(c)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_EQUIP_LIMIT)
		e1:SetReset(RESET_EVENT+RESETS_STANDARD)
		e1:SetValue(function(e,c) return c==e:GetLabelObject() end)
		e1:SetLabelObject(hg)
		c:RegisterEffect(e1)
		local e2=Effect.CreateEffect(c)
		e2:SetDescription(aux.Stringid(id,0))
		e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		e2:SetCode(EVENT_ATTACK_ANNOUNCE)
		e2:SetRange(LOCATION_SZONE)
		e2:SetCondition(s.activecon)
		e2:SetOperation(s.activeop)
		e2:SetReset(RESET_EVENT+RESETS_STANDARD)
		c:RegisterEffect(e2)
	end
end
function s.activecon(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():GetEquipTarget()==Duel.GetAttacker()
end
function s.activeop(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	local restmana=ally:GetOverlayGroup()
	if #restmana==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local tc=restmana:Select(tp,0,1,nil)
	if #tc>0 then Duel.Remove(tc,POS_FACEUP,REASON_EFFECT) end
end