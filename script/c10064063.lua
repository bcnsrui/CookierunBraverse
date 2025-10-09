local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,3,3)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	local count=Duel.AnnounceNumber(tp,2,1,0)
	if count==0 then return end
	if count==2 and Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)<2 then
	local g1=Duel.GetDecktopGroup(tp,1)
	Duel.Overlay(ally,g1)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp)
	local g2=Duel.GetDecktopGroup(tp,1)
	Duel.Overlay(ally,g2)	
	else
	local g=Duel.GetDecktopGroup(tp,count)
	Duel.Overlay(ally,g) end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local supportarea=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local mana=supportarea:Select(tp,1,1,nil)
	Duel.SendtoGrave(mana,REASON_EFFECT)
end