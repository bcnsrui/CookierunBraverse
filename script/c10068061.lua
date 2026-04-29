if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetRange(LOCATION_MZONE)
	e1:SetValue(function(e,c)
		local tp=c:GetControler()
		local allymain=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
		local enemymain=Duel.GetMatchingGroup(Card.IsFaceup,1-tp,LOCATION_EMZONE,0,nil):GetFirst()
		local myactive=Duel.GetFieldGroupCount(tp,LOCATION_REMOVED,0)
		local myrest=allymain and allymain:GetOverlayGroup():GetCount() or 0
		local enemyactive=Duel.GetFieldGroupCount(1-tp,LOCATION_REMOVED,0)
		local enemyrest=enemymain and enemymain:GetOverlayGroup():GetCount() or 0
		if myactive+myrest+2<=enemyactive+enemyrest then return 1 else return 0 end
	end)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xc05)
	c:RegisterEffect(e2)
end