if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_EARTH,1,1)
end
function s.c08filter(c)
	return c:IsSetCard(0xc08) and c:IsRace(RACE_WARRIOR)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if not c:IsLocation(LOCATION_GRAVE) then return end
	local ct=math.min(Duel.GetFieldGroupCount(tp,LOCATION_DECK,0),5)
	if ct==0 then return end
	local g=Duel.GetDecktopGroup(tp,ct)
	Duel.ConfirmCards(tp,g)
	local pg=g:FilterSelect(tp,s.c08filter,0,1,nil)
	if #pg>0 then
		Duel.SendtoHand(pg,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,pg)
		Duel.ShuffleHand(tp)
		g:Sub(pg)
	end
	if #g>0 then Duel.SendtoGrave(g,REASON_EFFECT) end
end