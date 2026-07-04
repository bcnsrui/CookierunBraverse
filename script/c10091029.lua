if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_LIGHT,1,1)
end
function s.treeancientfilter(c,tp)
	return (c:IsCode(table.unpack(CARD_MILLENNIAL_TREE_COOKIE)) or c:IsSetCard(0xc04))
		and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.cookieatkchange(e,tp,eg,ep,ev,re,r,rp,PHASE_END,1,g,-1) end
	if Duel.IsExistingMatchingCard(s.treeancientfilter,tp,LOCATION_MZONE,0,1,nil,tp)
	and Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ALL_COLOR,0,1)
	and Duel.SelectYesNo(tp,aux.Stringid(10060003,1)) then
		Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,0,1)
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local sg=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
		if #sg>0 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,sg,1) end
	end
end