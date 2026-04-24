if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WATER,2,2,0,0)
end
function s.Stageeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=2
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,2)
end
