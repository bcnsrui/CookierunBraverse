if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_LIGHT,1,1)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(nil,tp,LOCATION_EMZONE,0,nil):GetFirst()
	return ally and ally:IsSetCard(0xa07)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local ct=Duel.AnnounceNumber(tp,2,1,0)
	if ct>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,ct) end
end