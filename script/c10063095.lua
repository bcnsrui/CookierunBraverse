if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WATER,1,1,1,1)
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local opts={
		aux.Stringid(id,0),
		aux.Stringid(id,1)
	}
	local sel=Duel.SelectOption(tp,table.unpack(opts))
	if sel==0 then
		local g=Duel.GetDecktopGroup(tp,3)
		if #g==0 then return end
		Duel.ConfirmCards(tp,g)
		local tg=g:Select(tp,3,3,nil)
		Duel.SortDecktop(tp,tp,3)
		Duel.ConfirmCards(1-tp,g)
	else
		Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
		Duel.SendtoDeck(e:GetHandler(),nil,1,REASON_EFFECT)
	end
end