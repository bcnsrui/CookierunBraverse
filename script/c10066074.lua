if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WATER,3,3)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_WATER,1,1)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd011)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xd031)
	c:RegisterEffect(e2)
end
function s.QECookiecost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Cookie3.handcon(e,tp,eg,ep,ev,re,r,rp,chk,ALL_COLOR,2,2)
end
function s.QECookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.handcost(e,tp,eg,ep,ev,re,r,rp,ALL_COLOR,2,2)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
	if #g>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,2) end
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	if Duel.GetFieldGroupCount(tp,LOCATION_HAND,0)<=5 then
	local count=Duel.AnnounceNumber(tp,2,1,0)
	if count==0 then return end
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,count) end
end