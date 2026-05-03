if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,3,3)
	Cookie6.IGCoookieEffect(c,0,ATTRIBUTE_DARK,0,0)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local g=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	return g:FilterCount(Card.IsAttribute,nil,ATTRIBUTE_DARK)>=3
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler())
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.CookieTrashop(e,1-tp,eg,ep,ev,re,r,rp,3)
end