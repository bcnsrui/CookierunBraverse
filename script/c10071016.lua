if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_DARK,1,1)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFieldGroupCount(tp,LOCATION_GRAVE,0)>=15
		and Duel.IsExistingMatchingCard(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,1,nil,tp)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1) end
end