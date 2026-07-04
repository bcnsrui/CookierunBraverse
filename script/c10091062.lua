if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WATER,2,2,0,0)
end
function s.Stagecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return true
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.SendtoGrave(e:GetHandler(),REASON_COST)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetFieldGroup(1-tp,LOCATION_HAND,0)
	if #g>0 then Duel.ConfirmCards(tp,g) end
end