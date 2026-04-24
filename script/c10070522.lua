if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_DARK,2,2,0,0)
	Cookie6.QECoookieEffect2(c)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if e:GetHandler():GetCounter(0x1000)>=1 then return end
	local count=Duel.AnnounceNumber(tp,1,0)
	if count==1 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end
	e:GetHandler():AddCounter(0x1000,1)
end