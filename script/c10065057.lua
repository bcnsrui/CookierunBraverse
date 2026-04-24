local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,1,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WIND,0,0)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)>=1
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	local mana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local g=mana:Select(tp,1,1,nil)
	if #g>0 then Duel.SendtoGrave(g,REASON_COST) end
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),1)
end