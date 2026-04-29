if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,3,3)
	Cookie6.QECoookieEffect2(c)
	local e0=Effect.CreateEffect(c)
	e0:SetDescription(aux.Stringid(10061004,0))
	e0:SetType(EFFECT_TYPE_QUICK_O)
	e0:SetCode(EVENT_FREE_CHAIN)
	e0:SetRange(LOCATION_EXTRA)
	e0:SetCondition(s.Extracon)
	e0:SetTarget(Cookie3.notg)
	e0:SetOperation(s.Extraop)
	c:RegisterEffect(e0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd014)
	c:RegisterEffect(e1)
end
function s.Extracon(e)
	local tp=e:GetHandlerPlayer()
	return Duel.GetTurnPlayer()==tp and Duel.GetCurrentPhase()==PHASE_BATTLE_STEP
	and not (Duel.GetAttacker() and Duel.GetAttacker():IsControler(tp)) and Duel.GetCurrentChain()==0
	and Duel.GetLocationCount(tp,LOCATION_MZONE)>0
	and Cookie3.SupportAreaCount(e,tp,nil,nil,nil,nil,nil,nil,1,1,0,0)+2
		<=Cookie3.SupportAreaCount(e,tp,nil,nil,nil,nil,nil,nil,0,0,1,1)
end
function s.Extraop(e,tp,eg,ep,ev,re,r,rp)
	Cookie3.Cookiesummonop(e,tp,eg,ep,ev,re,r,rp,e:GetHandler())
end
function s.greenfilter(c)
	return c:IsAttribute(ATTRIBUTE_WIND)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local cnt=Duel.GetMatchingGroupCount(s.greenfilter,tp,LOCATION_GRAVE,0,nil)
	if cnt==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local sg=Duel.SelectMatchingCard(tp,s.greenfilter,tp,LOCATION_GRAVE,0,0,1,nil)
	if #sg>0 then Duel.Remove(sg,POS_FACEUP,REASON_EFFECT) end
end