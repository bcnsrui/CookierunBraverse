if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WATER,1,2)
end
function s.Itemcost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,chk,ALL_COLOR,2,2)
end
function s.Itemcostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,2,2)
end
function s.shadow_milk_filter(c,tp)
	return c:IsCode(table.unpack(CARD_SHADOW_MILK)) and Cookie3.NoEmFzonefilter(c,tp)
	and not c:GetEquipGroup():IsExists(Card.IsSetCard,1,nil,0xc03)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,2) end
	if Duel.IsExistingMatchingCard(s.shadow_milk_filter,tp,LOCATION_MZONE,0,1,nil)
	and Duel.SelectYesNo(tp,aux.Stringid(10061004,1)) then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local hg=Duel.SelectMatchingCard(tp,s.shadow_milk_filter,tp,LOCATION_MZONE,0,1,1,nil):GetFirst()
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
	e2:SetValue(0xd083)
	e2:SetCondition(s.equipcon)
	e2:SetReset(RESET_EVENT+RESETS_STANDARD)
	hg:RegisterEffect(e2) end
end
function s.equipcon(e)
	local tp=e:GetHandlerPlayer()
	return Duel.GetTurnPlayer()==tp and Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=5
end