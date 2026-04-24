if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_LIGHT,1,1,1,1)
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
end
function s.Stageeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	return ally:IsSetCard(0xa07)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,ag,1)
	if Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,chk,ATTRIBUTE_LIGHT,1,1)
	and Duel.IsExistingMatchingCard(Card.ListsCode,tp,LOCATION_MZONE,0,1,nil,CARD_ANANAS_DRAGON)
	and Duel.SelectYesNo(tp,aux.Stringid(10060003,1)) then
	Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_LIGHT,1,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Card.ListsCode,tp,LOCATION_MZONE,0,1,1,nil,CARD_ANANAS_DRAGON)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,ag,1) end
end