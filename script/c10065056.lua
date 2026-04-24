if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,3,3)
	Cookie6.QECoookieEffect(c,ATTRIBUTE_WIND,0,0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd133)
	c:RegisterEffect(e1)
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_ADD_SETCODE)
	e2:SetValue(0xd31)
	c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_SINGLE)
	e3:SetCode(EFFECT_ADD_SETCODE)
	e3:SetValue(0xd14)
	c:RegisterEffect(e3)
end
CardListsCode={CARD_LONGAN_DRAGON}
function s.QECookieeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if Duel.GetTurnPlayer()~=tp then return false end
	local eyeok=Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,0,0,0)>=3
		and Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ATTRIBUTE_WIND,1,1)
		and Duel.GetFlagEffect(tp,id)==0
	local riseok=c:GetAttackedCount()>0
		and Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,1,0,0)>=1
		and Duel.GetFlagEffect(tp,id+100)==0
	return eyeok or riseok
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local eyeok=Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,1,0,0,0)>=3
		and Cookie3.manacon(e,tp,eg,ep,ev,re,r,rp,0,ATTRIBUTE_WIND,1,1)
		and Duel.GetFlagEffect(tp,id)==0
	local riseok=c:GetAttackedCount()>0
		and Cookie3.SupportAreaCount(e,tp,eg,ep,ev,re,r,rp,0,1,0,0)>=1
		and Duel.GetFlagEffect(tp,id+100)==0
	if not eyeok and not riseok then return end
	local op=0
	if eyeok and riseok then
		op=Duel.SelectOption(tp,aux.Stringid(id,1),aux.Stringid(id,2))
	elseif riseok then
		op=1
	end
	if op==0 then
		Cookie3.manacost(e,tp,eg,ep,ev,re,r,rp,ATTRIBUTE_WIND,1,1)
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
		local g=Duel.SelectMatchingCard(tp,Cookie3.NoEmFzonefilter,tp,0,LOCATION_MZONE,0,1,nil,tp)
		if #g>0 then Cookie7.damageeff(e,tp,eg,ep,ev,re,r,rp,g,2) end
		Duel.RegisterFlagEffect(tp,id,RESET_PHASE+PHASE_END,0,1)
	else
		local mana=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,0,1,0,0)
		Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060002,5))
		local g=mana:Select(tp,0,1,nil)
		if #g>0 then Duel.Remove(g,POS_FACEUP,REASON_EFFECT) end
		Duel.RegisterFlagEffect(tp,id+100,RESET_PHASE+PHASE_END,0,1)
	end
end