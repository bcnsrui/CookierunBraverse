if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,2,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WATER,1,1)
end
function s.oplv1filter(c,tp)
	return c:IsLevel(1) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.stagefilter(c)
	return c:IsLocation(LOCATION_FZONE)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.oplv1filter,tp,0,LOCATION_MZONE,1,nil,tp)
		or Duel.IsExistingMatchingCard(s.stagefilter,tp,LOCATION_FZONE,LOCATION_FZONE,1,nil)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Group.CreateGroup()
	local g1=Duel.GetMatchingGroup(s.oplv1filter,tp,0,LOCATION_MZONE,nil,tp)
	local g2=Duel.GetMatchingGroup(s.stagefilter,tp,LOCATION_FZONE,LOCATION_FZONE,nil)
	g:Merge(g1)
	g:Merge(g2)
	if #g>0 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local sg=g:Select(tp,1,1,nil)
		Duel.SendtoDeck(sg,nil,SEQ_DECKBOTTOM,REASON_EFFECT)
	end
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)>=5 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
		local hg=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
		if #hg>0 then Duel.SendtoGrave(hg,REASON_EFFECT) end
	end
end