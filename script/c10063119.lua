if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_DARK,1,1,2,2)
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local count=Duel.AnnounceNumber(tp,3,2,1,0)
	if count==0 then return end
	Cookie3.CookieTrashop(e,tp,eg,ep,ev,re,r,rp,count)
end
