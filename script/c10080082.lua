local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_LIGHT,0,0)
end
function s.hp1cookiefilter(c)
	return c:GetDefense()==1 and c:IsRace(RACE_WARRIOR) and not c:IsSetCard(0xb00)
end
function s.Trapcost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_LIGHT,1,2)
		or Duel.GetMatchingGroupCount(s.hp1cookiefilter,tp,LOCATION_GRAVE,0,nil)>=1
end
function s.Trapcostoperation(e,tp,eg,ep,ev,re,r,rp)
	local cost1=Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ATTRIBUTE_LIGHT,1,2)
	local cost2=Duel.GetMatchingGroupCount(s.hp1cookiefilter,tp,LOCATION_GRAVE,0,nil)>=1
	if cost1 and cost2 then
		local opts={aux.Stringid(id,0),aux.Stringid(id,1)}
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
		local sel=Duel.SelectOption(tp,table.unpack(opts))+1
		if sel==1 then
			Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,1,2)
		else
			Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
			local g=Duel.SelectMatchingCard(tp,s.hp1cookiefilter,tp,LOCATION_GRAVE,0,1,1,nil)
			Duel.SendtoExtraP(g,nil,REASON_COST)
		end
	elseif cost1 then
		Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,1,2)
	else
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
		local g=Duel.SelectMatchingCard(tp,s.hp1cookiefilter,tp,LOCATION_GRAVE,0,1,1,nil)
		Duel.SendtoExtraP(g,nil,REASON_COST)
	end
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local eg=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,1,nil,tp)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,ag:GetFirst(),2)
	Cookie7.hpaddop(e,1-tp,eg,ep,ev,re,r,rp,eg:GetFirst(),2)
end