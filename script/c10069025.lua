if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xb00)
	c:RegisterEffect(e1)
end
function s.FlipCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)>=1
end
function s.FlipCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_DISCARD)
	local g=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,1,1,nil)
	if #g>0 then Duel.SendtoGrave(g,REASON_COST+REASON_DISCARD) end
end
function s.FlipCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local hg=e:GetLabelObject()
	if not hg then return end
	local c=e:GetHandler()
	if Duel.GetTurnPlayer()==tp then
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,0,1,nil,tp)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,g,1)
	else Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,hg,1) end
end