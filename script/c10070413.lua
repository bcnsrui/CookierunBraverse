local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.SSCookieEffect(c,ATTRIBUTE_WATER,1,1)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
	if not Duel.SelectYesNo(tp,aux.Stringid(id,0)) then return end
	local g=Duel.GetDecktopGroup(tp,3)
	Duel.DisableShuffleCheck()
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local sc=g:Select(tp,1,1,nil):GetFirst()
	Duel.SendtoHand(sc,nil,REASON_EFFECT)
	Duel.ConfirmCards(1-tp,sc)
	Duel.ShuffleHand(tp)
	g:RemoveCard(sc)
	Duel.MoveToDeckBottom(g,tp)
	Duel.SortDeckbottom(tp,tp,#g)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
end
function s.andoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not c:IsLocation(LOCATION_MZONE) then return end
	local cost3=Cookie3.handcostcon(e,tp,eg,ep,ev,re,r,rp,2,2)
	if not cost3 then return end
	if not Duel.SelectYesNo(tp,aux.Stringid(id,0)) then return end
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,2,2)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil)
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1)
end