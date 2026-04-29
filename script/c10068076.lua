if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,2,2)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xc05)
	c:RegisterEffect(e2)
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():IsLocation(LOCATION_MZONE)
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.SendtoDeck(e:GetHandler(),nil,SEQ_DECKBOTTOM,REASON_COST)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,1)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local ag=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #ag>0 then
	local tc=ag:GetFirst()
	tc:AddCounter(0x1003,1)
	local e1=Effect.CreateEffect(tc)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetCondition(s.attackcon)
	e1:SetValue(0xa10)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END,2)
	tc:RegisterEffect(e1)
	local e2=Effect.CreateEffect(tc)
	e2:SetDescription(aux.Stringid(id,1))
	e2:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e2:SetCode(EVENT_PREDRAW)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCountLimit(1)
	e2:SetCondition(s.attackcon2)
	e2:SetOperation(s.attackop)
	e2:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END,2)
	tc:RegisterEffect(e2) end
end
function s.attackcon(e)
	return e:GetHandler():GetCounter(0x1003)>0
end
function s.attackcon2(e)
	local c=e:GetHandler()
	local tp=c:GetControler()
	local cnt=c:GetCounter(0x1003)
	local handcount=Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)
	return c:GetCounter(0x1003)>0 and handcount>=cnt*2 and c:IsDefensePos()
end
function s.attackop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local cnt=c:GetCounter(0x1003)
	if cnt==0 then return end
	local cost=cnt*2
	local handcount=Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)
	if handcount>=cost and Duel.SelectYesNo(tp,aux.Stringid(10068076,0)) then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
		local hg=Duel.SelectMatchingCard(tp,nil,tp,LOCATION_HAND,0,cost,cost,nil)
		Duel.SendtoGrave(hg,REASON_RULE)
		c:RemoveCounter(tp,0x1003,cnt,REASON_EFFECT)
	end
end