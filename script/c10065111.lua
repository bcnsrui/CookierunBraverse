if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ALL_COLOR,0,1)
end
function s.dragonfilter(c,tp)
	return c:IsSetCard(0xc07) and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.lowhpcon(e)
	return e:GetHandler():GetOverlayCount()<=3
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.IsExistingMatchingCard(s.dragonfilter,tp,LOCATION_MZONE,0,1,nil,tp)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local hg=Duel.SelectMatchingCard(tp,s.dragonfilter,tp,LOCATION_MZONE,0,1,1,nil,tp):GetFirst()
	if not hg then return end
	Duel.Equip(tp,c,hg)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_EQUIP_LIMIT)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD)
	e1:SetValue(function(e,ec) return ec==e:GetLabelObject() end)
	e1:SetLabelObject(hg)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_UPDATE_ATTACK)
	e2:SetCondition(s.lowhpcon)
	e2:SetValue(1)
	e2:SetReset(RESET_EVENT+RESETS_STANDARD)
	hg:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_SINGLE)
	e3:SetCode(EFFECT_ADD_SETCODE)
	e3:SetCondition(s.lowhpcon)
	e3:SetValue(0xd071)
	e3:SetReset(RESET_EVENT+RESETS_STANDARD)
	hg:RegisterEffect(e3)
end