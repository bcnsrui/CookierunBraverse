local s,id=GetID()
function s.initial_effect(c)
	Cookie6.ItemEffect(c,ATTRIBUTE_LIGHT,2,2)
end
function s.lv2cookiefilter(c,tp)
	return c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsLevelAbove(2) and c:IsRace(RACE_WARRIOR) and Cookie3.NoEmFzonefilter(c,tp)
end
function s.lv3cookiefilter(c)
	return c:IsFaceup() and c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsLevel(3) and c:IsRace(RACE_WARRIOR)
end
function s.Itemcost(e,tp,eg,ep,ev,re,r,rp,chk)
	return Duel.GetMatchingGroupCount(s.lv2cookiefilter,tp,LOCATION_MZONE,0,nil,tp)>0
end
function s.Itemeffcondition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetMatchingGroupCount(s.lv3cookiefilter,tp,LOCATION_EXTRA,0,nil)>0
end
function s.Itemcostoperation(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060000,6))
	local g=Duel.SelectMatchingCard(tp,s.lv2cookiefilter,tp,LOCATION_MZONE,0,1,1,nil,tp)
	local tc=g:GetFirst()
	Duel.SendtoExtraP(tc,nil,REASON_COST)
	e:SetLabelObject(tc)
end
function s.Itemoperation(e,tp,eg,ep,ev,re,r,rp)
	local exc=e:GetLabelObject()
	Duel.Hint(HINT_SELECTMSG,tp,aux.Stringid(10060001,1))
	local g=Duel.SelectMatchingCard(tp,s.lv3cookiefilter,tp,LOCATION_EXTRA,0,0,1,exc)
	if #g>0 then Duel.SendtoGrave(g,REASON_EFFECT)
	Duel.SpecialSummon(g,0,tp,tp,false,false,POS_FACEUP_ATTACK) end
end