if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_DARK,2,3)
	Cookie6.IGCoookieEffect(c,1,ATTRIBUTE_DARK,0,1)
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_SINGLE)
	e0:SetCode(EFFECT_ADD_SETCODE)
	e0:SetValue(0xc05)
	c:RegisterEffect(e0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCondition(s.mixcon)
	e1:SetValue(0xa11)
	c:RegisterEffect(e1)
end
function s.specialfilter(c,tp)
	return (c:IsCode(table.unpack(CARD_CAPSAICIN)) or c:IsCode(table.unpack(CARD_KOUIGN_AMANN)))
	and Cookie3.NoEmFzonefilter(c,tp)
end
function s.mixcon(e)
	local tp=e:GetHandlerPlayer()
	return Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil):GetSum(Card.GetLevel)>=3
	or Duel.IsExistingMatchingCard(s.specialfilter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.arenafilter(c)
	return c:IsSetCard(0xc01)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.arenafilter,tp,LOCATION_GRAVE,0,nil)>=7
	and Duel.GetMatchingGroupCount(Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,nil,tp)>=1
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,3))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1) end
end