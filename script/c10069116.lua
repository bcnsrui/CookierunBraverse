if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_DARK,1,1)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFieldGroupCount(1-tp,LOCATION_GRAVE,0)>=0
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,1-tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(1-tp,Cookie3.NoEmFzonefilter,1-tp,LOCATION_MZONE,0,1,1,nil,tp)
	if #g>0 then Cookie7.hptrasheff(e,tp,eg,ep,ev,re,r,rp,g,1) end
end