local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_WATER,3,3)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local ophand=Duel.GetFieldGroupCount(tp,0,LOCATION_HAND)
	local myhand=Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)
	local draw=ophand-myhand
	if draw>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,draw) end
end