if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WIND,1,1,1,1)
end
function s.Stageeffectcondition(e,tp,eg,ep,ev,re,r,rp)
	if chk==0 then return Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,chk,ALL_COLOR,1,1) end
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local ally=Cookie3.SupportAreafilterCount(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	local enemy=Cookie3.SupportAreafilterCount(e,tp,eg,ep,ev,re,r,rp,0,0,1,1)
	if ally<enemy then
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local hg=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,LOCATION_HAND,0,1,1,nil)
		Duel.Remove(hg,POS_FACEUP,REASON_EFFECT)
	end
end
