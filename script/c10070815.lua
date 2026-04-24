if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,2,2)
end
function s.windarcherfilter(c,tp)
	return c:IsCode(10062058,10064049,10070805) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.supportarcherfilter(c)
	return c:IsCode(10062058,10064049,10070805)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local support=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	return Duel.IsExistingMatchingCard(s.windarcherfilter,tp,LOCATION_MZONE,0,1,nil,tp)
		or support:IsExists(s.supportarcherfilter,1,nil)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally then
		Duel.DisableShuffleCheck()
		local count=Duel.AnnounceNumber(tp,1,0)
		local tc=Duel.GetDecktopGroup(tp,count)
		Duel.Overlay(ally,tc) end
	local support=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	if #support==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=support:Select(tp,0,1,nil)
	if #g>0 then
		Duel.SendtoHand(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g) end
end