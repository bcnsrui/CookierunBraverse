if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_LIGHT,0,0)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)>=1
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,0,1,nil)
	if #g>0 then Duel.SendtoDeck(g,nil,SEQ_DECKTOP,REASON_COST)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),1) end
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),1)
end