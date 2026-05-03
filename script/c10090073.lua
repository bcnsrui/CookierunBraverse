if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_WIND,4,4)
	local e0=Effect.CreateEffect(c)
	e0:SetType(EFFECT_TYPE_QUICK_O)
	e0:SetCode(EVENT_FREE_CHAIN)
	e0:SetRange(LOCATION_EXTRA)
	e0:SetCondition(s.Summoncon)
	e0:SetTarget(Cookie3.notg)
	e0:SetOperation(s.Summonop)
	c:RegisterEffect(e0)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd03)
	c:RegisterEffect(e1)
end
function s.matfilter(c,tp)
	return c:IsCode(table.unpack(CARD_WHITE_LILY))
end
function s.Summoncon(e)
	local tp=e:GetHandlerPlayer()
	return Cookie8.ExtraSummoncon2(e) and Cookie3.SupportAreaCount(e,tp,nil,nil,nil,nil,nil,nil,1,1,0,0)>=8
	and Duel.IsExistingMatchingCard(s.matfilter,tp,LOCATION_MZONE,0,1,nil)
end
function s.Summonop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
	local sc=Duel.SelectMatchingCard(tp,s.matfilter,tp,LOCATION_MZONE,0,1,1,nil):GetFirst()
	if not sc then return end
	c:SetMaterial(sc)
	local equipgroup=sc:GetEquipGroup()
	equipgroup:Merge(sc)
	Duel.Overlay(c,sc)
	Duel.SpecialSummon(c,0,tp,tp,false,false,POS_FACEUP_ATTACK)
	Cookie8.eventop(e,tp,eg,ep,ev,re,r,rp,c)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xa12)
	e1:SetReset(RESET_EVENT+RESETS_STANDARD+RESET_PHASE+PHASE_END)
	ally:RegisterEffect(e1)
	for tc in aux.Next(equipgroup) do
		Duel.Equip(tp,tc,c)
		local e1=Effect.CreateEffect(tc)
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_EQUIP_LIMIT)
		e1:SetReset(RESET_EVENT|RESETS_STANDARD)
		e1:SetValue(function(e,x) return x==e:GetLabelObject() end)
		e1:SetLabelObject(c)
		tc:RegisterEffect(e1)
		local e2=Effect.CreateEffect(tc)
		e2:SetType(EFFECT_TYPE_SINGLE+EFFECT_TYPE_CONTINUOUS)
		e2:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
		e2:SetCode(EVENT_LEAVE_FIELD)
		e2:SetOperation(function(e,tp,eg,ep,ev,re,r,rp) Cookie3.bttrashop(e,tp,eg,ep,ev,re,r,rp,tc)	end)
		e2:SetReset(RESET_TOGRAVE|RESET_REMOVE)
		tc:RegisterEffect(e2)
		if tc:IsCode(10063066) then
		local e3=Effect.CreateEffect(tc)
		e3:SetDescription(aux.Stringid(id,0))
		e3:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_CONTINUOUS)
		e3:SetCode(EVENT_ATTACK_ANNOUNCE)
		e3:SetRange(LOCATION_SZONE)
		e3:SetCondition(s.activecon)
		e3:SetOperation(s.activeop)
		e3:SetReset(RESET_EVENT+RESETS_STANDARD)
		tc:RegisterEffect(e3) end end
end
function s.activecon(e,tp,eg,ep,ev,re,r,rp)
	return e:GetHandler():GetEquipTarget()==Duel.GetAttacker()
end
function s.activeop(e,tp,eg,ep,ev,re,r,rp)
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if not ally then return end
	local restmana=ally:GetOverlayGroup()
	if #restmana==0 then return end
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local tc=restmana:Select(tp,0,1,nil)
	if #tc>0 then Duel.Remove(tc,POS_FACEUP,REASON_EFFECT) end
end
function s.AndCookiecost(e,tp,eg,ep,ev,re,r,rp)
	local mg=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	return mg:FilterCount(Card.IsRace,nil,RACE_WARRIOR)>=1
end
function s.AndCookiecostoperation(e,tp,eg,ep,ev,re,r,rp)
	local mg=Cookie3.SupportAreafilter(e,tp,eg,ep,ev,re,r,rp,1,1,0,0)
	mg=mg:Filter(Card.IsRace,nil,RACE_WARRIOR)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=mg:Select(tp,1,1,nil)
	Duel.SendtoHand(g,nil,REASON_COST)
	Duel.ConfirmCards(1-tp,g)
end
function s.AndCookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local dt=Duel.GetDecktopGroup(tp,1)
	if #dt==0 then return end
	local ally=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EMZONE,0,nil):GetFirst()
	if ally then Duel.Overlay(ally,dt) end
end