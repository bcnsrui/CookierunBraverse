if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_WATER,1,1,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
	e1:SetCode(EVENT_ATTACK_ANNOUNCE)
	e1:SetRange(LOCATION_FZONE)
	e1:SetCondition(s.dropcon)
	e1:SetOperation(s.drop)
	c:RegisterEffect(e1)
end
function s.dropcon(e,tp,eg,ep,ev,re,r,rp)
	local a=Duel.GetAttacker()
	return a:IsCode(table.unpack(CARD_SHADOW_MILK)) and a:IsControler(tp)
	and Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=5
end
function s.drop(e,tp,eg,ep,ev,re,r,rp)
	if Duel.SelectYesNo(tp,aux.Stringid(10060001,8)) then
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1) end
end