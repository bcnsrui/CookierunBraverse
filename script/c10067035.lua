if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,1,2)
	Cookie6.QECoookieEffect2(c)
	Cookie6.IGCoookieEffect(c,0,ALL_COLOR,0,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd014)
	c:RegisterEffect(e1)
end
function s.refcookie(c,tp)
	return (c:IsCode(table.unpack(CARD_CAPSAICIN)) or c:IsCode(table.unpack(CARD_PRUNE_JUICE))) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.IsExistingMatchingCard(s.refcookie,tp,LOCATION_MZONE,0,1,nil,tp) then
	Cookie7.hpaddop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler(),1)	end
end
function s.otherarena(c,exc,tp)
	return c~=exc and c:IsSetCard(0xc01) and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.IGCookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.restcon(e,tp,eg,ep,ev,re,r,rp,chk)
end
function s.IGCookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(s.otherarena,tp,LOCATION_MZONE,0,1,nil,e:GetHandler(),tp)
end
function s.IGCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.ChangePosition(e:GetHandler(),POS_FACEUP_DEFENSE)
end
function s.IGCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,1)
end