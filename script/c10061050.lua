local s,id=GetID()
function s.initial_effect(c)
	Cookie6.TrapEffect(c,ATTRIBUTE_LIGHT,1,1)
end
function s.Trapeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,2,nil,tp)
end
function s.Trapoperation(e,tp,eg,ep,ev,re,r,rp)
	local bt=Duel.GetAttackTarget()
	local g=Duel.GetMatchingGroup(Cookie3.NoEmFzonefilter,tp,LOCATION_MZONE,0,bt,tp)
	Duel.ChangeAttackTarget(g:GetFirst())
end