local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.TrapEffect(c)
	e1:SetTarget(s.target)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return
	Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_WIND,1,1) end
	Duel.SetChainLimit(aux.FALSE)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WIND,1,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil)
	if #g>0 then
		Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,-1)
	end
	if Duel.IsExistingMatchingCard(nil,tp,LOCATION_REMOVED,0,1,nil) then
		if Duel.SelectYesNo(tp,aux.Stringid(id,0)) then
			Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
			local rg=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_REMOVED,0,0,1,nil)
			if #rg>0 then
				Duel.SendtoHand(rg,nil,REASON_EFFECT)
				Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
				local hg=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,0,1,nil)
				if #hg>0 then
					Duel.Remove(hg,POS_FACEUP,REASON_EFFECT)
				end
			end
		end
	end
end