if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,1,2)
	Cookie6.IGCoookieEffect(c,0,ALL_COLOR,0,0)
end
function s.bottomfilter(c,tp)
	return c:IsSetCard(0xc01) and c:IsAttribute(ATTRIBUTE_WATER) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.bottomfilter,tp,LOCATION_MZONE,0,1,e:GetHandler(),tp)
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.SendtoDeck(e:GetHandler(),nil,SEQ_DECKBOTTOM,REASON_COST)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,8)) then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end
end