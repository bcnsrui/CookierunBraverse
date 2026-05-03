if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,2,2)
	Cookie6.IGCoookieEffect(c,0,ATTRIBUTE_WATER,0,0)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.SendtoDeck(e:GetHandler(),nil,SEQ_DECKTOP,REASON_EFFECT)
end