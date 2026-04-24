if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd031)
	c:RegisterEffect(e1)
end
function s.AndCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():GetOverlayCount()==1
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,0)) then
		Duel.SendtoHand(e:GetHandler(),nil,REASON_EFFECT)
	end
end