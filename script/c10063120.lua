if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_DARK,1,1,1,1)
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
		local count=Duel.AnnounceNumber(tp,2,1,0)
		if count==0 then return end
		Cookie3.CookieTrashop(e,tp,eg,ep,ev,re,r,rp,count)
	else
		local g=Duel.GetDecktopGroup(tp,3)
		if #g>0 then
			Duel.ConfirmCards(tp,g)
			local pg=g:FilterSelect(tp,Card.IsAttribute,0,1,nil,ATTRIBUTE_DARK)
			if #pg>0 then
				Duel.SendtoHand(pg,tp,REASON_EFFECT)
				Duel.ConfirmCards(1-tp,pg)
				Duel.ShuffleHand(tp)
			end
			g:Sub(pg)
			if #g>0 then
				Duel.SendtoGrave(g,REASON_EFFECT)
				Duel.ConfirmCards(1-tp,g)
			end
			Duel.SendtoGrave(e:GetHandler(),REASON_EFFECT)
		end
	end
end
