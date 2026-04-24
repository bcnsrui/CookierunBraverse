if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WIND,1,1)
end
function s.windarcherfilter(c,tp)
	return c:IsCode(10062058,10064049,10070805) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,0,1,0)>=1
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local em=Duel.GetMatchingGroup(Card.IsFaceup,tp,0,LOCATION_EMZONE,nil):GetFirst()
	local opactive=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,0,1,0)
	if #opactive>0 and em then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local g=opactive:Select(tp,1,1,nil)
		Duel.Overlay(em,g)
	end
	if Duel.IsExistingMatchingCard(s.windarcherfilter,tp,LOCATION_MZONE,0,1,nil,tp)
		and Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,1,0,0)>=1 then
		local rest=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,1,0,0)
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local rg=rest:Select(tp,1,1,nil)
		if #rg>0 then Duel.Remove(rg,POS_FACEUP,REASON_EFFECT) end
	end
end