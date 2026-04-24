local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,2,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_DARK,2,2)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local count=Duel.AnnounceNumber(tp,2,1,0)
	local g=Duel.GetFieldGroup(1-tp,LOCATION_HAND,0)
	if #g>0 then
		local ct=math.min(#g,count)
		local sg=g:RandomSelect(1-tp,ct)
		Duel.SendtoGrave(sg,REASON_EFFECT)
	end
	Cookie3.CookieDrawop(e,1-tp,eg,ep,ev,re,r,rp,2)
end