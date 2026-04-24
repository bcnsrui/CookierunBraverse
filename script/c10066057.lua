local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
	Cookie6.IGCoookieEffect(c,0,ATTRIBUTE_WIND,1,1)
end
function s.supportcookiefilter(c)
	return c:IsRace(RACE_WARRIOR)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	local mana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	return mana:IsExists(s.supportcookiefilter,1,nil)
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.SendtoGrave(e:GetHandler(),REASON_COST)
	local mana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local g=mana:Filter(s.supportcookiefilter,nil)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=g:Select(tp,1,1,nil)
	if #sg>0 then Duel.SendtoHand(sg,nil,REASON_COST)
	Duel.ConfirmCards(1-tp,sg) end
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local count=Duel.AnnounceNumber(tp,1,0)
	if count==0 then return end
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count)
end