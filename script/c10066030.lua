local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,3,3)
	Cookie6.QECoookieEffect2(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_ADD_SETCODE)
	e1:SetValue(0xd014)
	c:RegisterEffect(e1)
end
function s.lv2filter(c)
	return c:IsLevelAbove(2)
end
function s.QECookieoperation(e,tp,eg,ep,ev,re,r,rp)
	local ct=Duel.GetMatchingGroup(s.lv2filter,tp,LOCATION_EXTRA,0,nil):GetCount()
	if ct==4 then suricount=Duel.AnnounceNumber(tp,4,3,2,1,0)
	elseif ct==3 then suricount=Duel.AnnounceNumber(tp,3,2,1,0)
	elseif ct==2 then suricount=Duel.AnnounceNumber(tp,2,1,0)
	elseif ct==1 then suricount=Duel.AnnounceNumber(tp,1,0)
	else return end
	if suricount==0 then return end
	Cookie3.CookieDrawop(e,tp,eg,ep,ev,re,r,rp,suricount)
end