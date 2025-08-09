local s,id=GetID()
function s.initial_effect(c)
	Cookie.MainCharacter(c)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(10060002,1))
	e1:SetType(EFFECT_TYPE_QUICK_O)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetRange(LOCATION_EMZONE)
--	e1:SetCondition(s.Battleskillcon)
	e1:SetCondition(Cookie3.Battleskillcon)
	e1:SetOperation(s.shop)
	c:RegisterEffect(e1)
end
function s.Battleskillcon(e)
	local tp=e:GetHandlerPlayer()
	return Duel.GetCurrentPhase()==PHASE_BATTLE_STEP
	and not (Duel.GetAttacker() and Duel.GetAttacker():IsControler(tp))
end
function s.shop(e,tp,eg,ep,ev,re,r,rp)
    Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_CONFIRM)
    local psel=Duel.SelectOption(tp, aux.Stringid(10060002,2), aux.Stringid(10060002,3))
    local destp=(psel==0) and tp or (1-tp)

    Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SELECT)
    local g = Duel.SelectMatchingCard(tp,aux.TRUE,destp,LOCATION_DECK,0,0,5,nil)
    if #g==0 then return end
	
	local opts = {
    aux.Stringid(10060002,4),
    aux.Stringid(10060002,5),
    aux.Stringid(10060002,6),
    aux.Stringid(10060002,7),
	}
    Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOZONE)
    local sel=Duel.SelectOption(tp,table.unpack(opts))+1

    if sel==1 then
        Duel.SendtoGrave(g,REASON_EFFECT)
    elseif sel==2 then
        Duel.Remove(g,POS_FACEUP,REASON_EFFECT)
    elseif sel==3 then
        Duel.SendtoHand(g,destp,REASON_EFFECT)
        if destp==tp then Duel.ConfirmCards(1-tp,g)
        else Duel.ConfirmCards(tp,g) end
    elseif sel==4 then
        for tc in aux.Next(g) do
            Duel.SendtoExtraP(tc,destp,REASON_EFFECT)
        end
    end
end