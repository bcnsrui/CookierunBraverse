if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,2,2)
	Cookie6.IGCoookieEffect(c,0,ATTRIBUTE_WATER,0,0)
end
function s.bluelv2filter(c,tp)
	return c:IsAttribute(ATTRIBUTE_WATER) and c:GetLevel()>=2 and c:IsRace(RACE_WARRIOR)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=3
	and Duel.IsExistingMatchingCard(s.bluelv2filter,tp,LOCATION_HAND,0,1,nil)
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.SendtoDeck(e:GetHandler(),nil,SEQ_DECKBOTTOM,REASON_COST)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetLocationCount(tp,LOCATION_MZONE)>0
	and Duel.IsExistingMatchingCard(s.bluelv2filter,tp,LOCATION_HAND,0,1,nil)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local hg=Duel.SelectMatchingCard(tp,s.bluelv2filter,tp,LOCATION_HAND,0,0,1,nil)
	if #hg>0 then Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,hg)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,hg,1)	end
end