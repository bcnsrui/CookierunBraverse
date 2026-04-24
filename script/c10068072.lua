local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,2,2)
end
function s.mysticflowerfilter(c,tp)
	return c:IsCode(10068059) and Cookie3.NoEmFzonefilter(c,tp)
	and not c:GetEquipGroup():IsExists(Card.IsSetCard,1,nil,0xc03)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local allysupport=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local enemysupport=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)
	return #allysupport<#enemysupport
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local deckcount=Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)
	local ct=Duel.AnnounceNumber(tp,math.min(2,deckcount),1,0)
	if ct==0 then return end
	local g=Duel.GetDecktopGroup(tp,ct)
	Duel.ConfirmCards(tp,g)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(id,0))
	local active=g:FilterSelect(tp,aux.TRUE,0,1,nil)
	Duel.Remove(active,POS_FACEUP,REASON_EFFECT)
	g:RemoveCard(active)
	if #g>0 then
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	Duel.Overlay(ally,g) end
	if Duel.GetMatchingGroupCount(s.mysticflowerfilter,tp,LOCATION_MZONE,0,nil,tp)>=1
	and Duel.SelectYesNo(tp,aux.Stringid(10061004,1)) then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local hg=Duel.SelectMatchingCard(tp,s.mysticflowerfilter,tp,LOCATION_MZONE,0,1,1,nil,tp):GetFirst()
	Duel.Equip(tp,c,hg)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_EQUIP_LIMIT)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD)
	e1:SetValue(function(e,c) return c==e:GetLabelObject() end)
	e1:SetLabelObject(hg)
	c:RegisterEffect(e1)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,hg,1) end
end