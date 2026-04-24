if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,1,2)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_WIND,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd012)
	c:RegisterEffect(e1)
end
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)>=1
		and Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)>=1
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=g:Select(tp,1,1,nil)
	Duel.SendtoGrave(sg,REASON_EFFECT)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local decktop=Duel.GetDecktopGroup(tp,1)
	Duel.Remove(decktop,POS_FACEUP,REASON_EFFECT)
end