if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_WIND,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xc05)
	c:RegisterEffect(e1)
end
function s.greensupportfilter(c)
	return c:IsAttribute(ATTRIBUTE_WIND)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	local allymana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	return allymana:FilterCount(s.greensupportfilter,nil)>=2
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	local allymana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local greens=allymana:Filter(s.greensupportfilter,nil)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local sg=greens:Select(tp,2,2,nil)
	Duel.SendtoHand(sg,nil,REASON_COST)
	Duel.ConfirmCards(1-tp,sg)
	Duel.ShuffleHand(tp)
end
function s.mysticfilter(c)
	return c:IsCode(10068059)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return not Duel.IsExistingMatchingCard(s.mysticfilter,tp,LOCATION_MZONE,0,1,e:GetHandler())
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)
	Cookie7.Allhptrasheff(e,tp,eg,ep,ev,re,r,rp,g,2)
end