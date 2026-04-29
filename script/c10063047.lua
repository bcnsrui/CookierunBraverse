if not Cookie2 then Duel.LoadScript("deprecated_function.lua") end
local s,id=GetID()
function s.initial_effect(c)
	Cookie6.StageEffect(c,ATTRIBUTE_LIGHT,2,2,1,1)
end
function s.Stagecostoperation(e,tp,eg,ep,ev,re,r,rp)
end
function s.filter(c)
	return c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsRace(RACE_WARRIOR) and c:IsLocation(LOCATION_HAND)
end
function s.checklv3(g)
	if #g==0 then return false end
	local function canSum3(cards, target)
		if target==0 then return true end
		if target<0 or #cards==0 then return false end
		for i, card in ipairs(cards) do
			local remaining={}
			for j=1,#cards do
				if j~=i then table.insert(remaining, cards[j]) end
			end
			if canSum3(remaining, target-card:GetLevel()) then return true end
		end
		return false
	end
	local cards={}
	for tc in aux.Next(g) do
		table.insert(cards, tc)
	end
	return canSum3(cards, 3)
end
function s.Stageeffcondition(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(s.filter,tp,LOCATION_HAND,0,nil)
	return s.checklv3(g)
end
function s.lv3lightfilter(c)
	return c:IsFaceup() and c:IsLevel(3) and c:IsAttribute(ATTRIBUTE_LIGHT) and c:IsRace(RACE_WARRIOR)
end
function s.sum3check(sg,e,tp,mg)
	local sum=sg:GetSum(Card.GetLevel)
	return sum==3
end
function s.Stageoperation(e,tp,eg,ep,ev,re,r,rp)
	local g=Duel.GetMatchingGroup(s.filter,tp,LOCATION_HAND,0,nil)
	if #g==0 then return end
	local sg=aux.SelectUnselectGroup(g,e,tp,1,#g,s.sum3check,1,tp,aux.Stringid(10060000,6))
	if #sg>0 then
		Duel.SendtoExtraP(sg,nil,REASON_EFFECT)
		local brake=Duel.GetMatchingGroup(Card.IsFaceup,tp,LOCATION_EXTRA,0,nil)
		local lv3g=Duel.SelectMatchingCard(tp,s.lv3lightfilter,tp,LOCATION_EXTRA,0,1,1,nil)
		if #lv3g>0 then
			Duel.SendtoGrave(lv3g,REASON_EFFECT)
			Duel.SpecialSummon(lv3g,0,tp,tp,false,false,POS_FACEUP_ATTACK)
		end
	end
end