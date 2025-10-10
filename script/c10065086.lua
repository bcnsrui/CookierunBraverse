local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WATER,2,2)
end
function s.bluefilter(c)
	return c:IsAttribute(ATTRIBUTE_WATER) and c:IsRace(RACE_WARRIOR)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,nil,tp)==1
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local deckcount=Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)
	local g=Duel.GetDecktopGroup(tp,math.min(3,deckcount))
	Duel.ConfirmCards(tp,g)
	local sg=g:Filter(s.bluefilter,nil)
	if #sg>0 and Duel.SelectYesNo(tp,aux.Stringid(10061004,3)) then
	Duel.MoveToDeckBottom(g,tp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local tc=sg:Select(tp,1,1,nil)
	Duel.SpecialSummon(tc,0,tp,tp,false,false,POS_FACEUP_ATTACK)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,tc:GetFirst(),1)
	g:RemoveCard(tc)
	if #g>1 then Duel.SortDeckbottom(tp,tp,#g) end
	else
	Duel.MoveToDeckBottom(g,tp)
	if #g>1 then Duel.SortDeckbottom(tp,tp,#g) end end
end