if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
end
function s.bluearena2filter(c,tp,exc)
	return c~=exc and c:IsRace(RACE_WARRIOR) and c:IsSetCard(0xc01) and c:IsAttribute(ATTRIBUTE_WATER)
	and c:IsLevelBelow(2) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.bluearena2filter,tp,LOCATION_MZONE,0,1,e:GetHandler(),tp)
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.bluearena2filter,tp,LOCATION_MZONE,0,1,1,e:GetHandler(),tp)
	if #g>0 then Duel.SendtoDeck(g,nil,SEQ_DECKBOTTOM,REASON_COST) end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),1)
end