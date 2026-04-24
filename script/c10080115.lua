if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,1,2)
	Cookie6.IGCoookieEffect(c,0,ATTRIBUTE_WIND,0,0)
end
function s.arenasupportfilter(c)
	return c:IsRace(RACE_WARRIOR) and c:IsSetCard(0xc01)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local g=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	return g:FilterCount(Card.IsAttribute,nil,ATTRIBUTE_WIND)>=3 and e:GetHandler():IsAbleToGraveAsCost()
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler())
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
	local g=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0):Filter(s.arenasupportfilter,nil)
	if #g>0 and Duel.GetLocationCount(tp,LOCATION_MZONE)>0 then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local sg=g:Select(tp,1,1,nil)
		if #sg>0 then Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,sg:GetFirst()) end
	end
end