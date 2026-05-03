if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_LIGHT,1,1,1,1)
end
function s.Stageeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	return ally:IsSetCard(0xa07)
end
function s.ananasdragonfilter(c,tp)
	return c:IsCode(table.unpack(CARD_ANANAS_DRAGON)) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,ag,1)
	if Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ATTRIBUTE_LIGHT,1,1)
	and Duel.IsExistingMatchingCard(s.ananasdragonfilter,tp,LOCATION_MZONE,0,1,nil,tp)
	and Duel.SelectYesNo(tp,aux.Stringid(10060003,1)) then
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,1,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,s.ananasdragonfilter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,ag,1) end
end