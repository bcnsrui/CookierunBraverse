if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WATER,1,1,1,1)
end
function s.Stageeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=6
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local ct=Duel.AnnounceNumber(tp,1,0)
	if ct>0 then Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,ct) end
end