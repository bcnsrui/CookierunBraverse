local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_DARK,1,1)
end
function s.purpleitemfilter(c,tp,ct)
	local gravecount=Duel.GetFieldGroupCount(tp,LOCATION_GRAVE,0)
	return c:IsAttribute(ATTRIBUTE_DARK) and c:IsRace(RACE_SPELLCASTER)
	and c:GetSequence()<=gravecount and c:GetSequence()>=gravecount-ct+1
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)
	local ct=Duel.AnnounceNumber(tp,3,2,1,0)
	if ct==0 then return end
	Cookie3.CookieTrashop(e,tp,eg,ep,ev,re,r,rp,ct)
	local grave=Duel.GetFieldGroup(tp,LOCATION_GRAVE,0)
	if grave:IsExists(s.purpleitemfilter,1,nil,tp,ct) then
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local tg=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #tg>0 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,tg:GetFirst(),1) end end
end