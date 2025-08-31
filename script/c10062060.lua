local s,id=GetID()
function s.initial_effect(c)
	local e1=Cookie6.ESCookieEffect(c,ATTRIBUTE_DARK,2,2)
	e1:SetOperation(s.operation)
	c:RegisterEffect(e1)
end
function s.operation(e,tp,eg,ep,ev,re,r,rp)
	Cookie8.resetevent(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetFieldGroupCount(tp,0,LOCATION_GRAVE)<20 then return end
	if Duel.SelectYesNo(tp,aux.Stringid(id,0)) then
	Duel.Draw(tp,1,REASON_EFFECT)
	Cookie3.Refreshop(e,tp,eg,ep,ev,re,r,rp) end
end