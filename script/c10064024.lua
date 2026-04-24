if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetCode(EFFECT_CANNOT_SELECT_BATTLE_TARGET)
	e1:SetProperty(EFFECT_FLAG_SET_AVAILABLE+EFFECT_FLAG_IGNORE_IMMUNE)
	e1:SetRange(LOCATION_MZONE)
	e1:SetTargetRange(0,LOCATION_MZONE)
	e1:SetCondition(s.skillcon)
	e1:SetValue(s.tgtg)
	c:RegisterEffect(e1)
end
function s.ylv3mzone(c,tp)
	return c:IsFaceup() and c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsRace(RACE_WARRIOR) and c:GetLevel()==3 and Cookie3.NoEmFzonefilter(c,tp)
end
function s.skillcon(e)
	local tp=e:GetHandlerPlayer()
	return Duel.IsExistingMatchingCard(s.ylv3mzone,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.tgtg(e,c)
	local tp=e:GetHandlerPlayer()
	local hc=e:GetHandler()
	return c:IsControler(tp) and c~=hc and c:IsLocation(LOCATION_MZONE)
end