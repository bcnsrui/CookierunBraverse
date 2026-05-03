if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,2,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WATER,1,1)
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.SendtoDeck(e:GetHandler(),nil,SEQ_DECKBOTTOM,REASON_COST)
end
function s.lowhp_blue(c,tp)
	return c:IsAttribute(ATTRIBUTE_WATER) and c:GetOverlayCount()<=2 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.lowhp_blue,tp,LOCATION_MZONE,0,0,1,nil,tp)
	if #g>0 then Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,g,1) end
end