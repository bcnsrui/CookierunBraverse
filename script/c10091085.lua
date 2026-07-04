if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,2,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_DARK,1,1)
end
function s.purplelv2filter(c,tp)
	return c:IsAttribute(ATTRIBUTE_DARK) and c:IsLevelBelow(2) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler())
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.purplelv2filter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #g>0 then Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,g) end
end