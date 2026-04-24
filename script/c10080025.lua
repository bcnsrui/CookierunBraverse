if not Cookie or not Cookie2 or not Cookie4 or not Cookie6 then
	Duel.LoadScript("CS_init.lua")
end

local s,id=GetID()
function s.initial_effect(c)
	Cookie2.CookieCharacter(c,ATTRIBUTE_LIGHT,3,3)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetCondition(s.atkcon)
	e1:SetValue(s.atkval)
	c:RegisterEffect(e1)
end
s.listed_names={MARZIPAN_COOKIES}
function s.marzipanfilter(c)
	return c:IsRace(RACE_WARRIOR) and c:IsCode(table.unpack(s.listed_names))
end
function s.uniquecount(g)
	local codes={}
	local count=0
	for tc in aux.Next(g) do
		local code=tc:GetOriginalCodeRule()
		if not codes[code] then
			codes[code]=true
			count=count+1
		end
	end
	return count
end
function s.atkcon(e)
	local tp=e:GetHandlerPlayer()
	local battleg=Duel.GetMatchingGroup(function(c) return Cookie3.NoEmFzonefilter(c,tp) and s.marzipanfilter(c) end,tp,LOCATION_MZONE,0,nil)
	if s.uniquecount(battleg)<2 then return false end
	local supportg=Cookie3.SupportAreafilter(e,tp,nil,nil,nil,nil,nil,nil,1,1,0,0):Filter(s.marzipanfilter,nil)
	return s.uniquecount(supportg)>=4
end
function s.atkval(e,c)
	return c:GetBaseAttack()
end