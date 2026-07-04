if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,3,3)
	Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd024)
	c:RegisterEffect(e1)
end
function s.lv3handfilter(c)
	return c:IsRace(RACE_WARRIOR) and c:IsLevel(3) and not c:IsSetCard(0xc08)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local g=Duel.SelectMatchingCard(tp,s.lv3handfilter,tp,LOCATION_HAND,0,0,1,nil)
	if #g>0 then
		Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,g)
		Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,g,1)
	end
end