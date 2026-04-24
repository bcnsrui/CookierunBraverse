if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,2,2)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_WIND,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd133)
	c:RegisterEffect(e1)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)>=2
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=g:Select(tp,2,2,nil)
	Duel.SendtoGrave(sg,REASON_COST)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local dg=Duel.GetDecktopGroup(tp,1)
	if #dg>0 then Duel.Remove(dg,POS_FACEUP,REASON_EFFECT) end
	if Duel.GetFieldGroupCount(tp,LOCATION_DECK,0)==0 then Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp) end
	local dg2=Duel.GetDecktopGroup(tp,1)
	if #dg2>0 then Duel.Remove(dg2,POS_FACEUP,REASON_EFFECT) end
end