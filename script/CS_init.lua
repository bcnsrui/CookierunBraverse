LOCATION_EMZONE = 0x1000

function Duel.IsMainPhase()
	local phase=Duel.GetCurrentPhase()
	return phase==PHASE_MAIN1 or phase==PHASE_MAIN2
end

function Duel.IsBattlePhase()
	local phase=Duel.GetCurrentPhase()
	return phase>=PHASE_BATTLE_START and phase<=PHASE_BATTLE
end

--Cookie TCG Utility
Duel.LoadScript("CookieMainCharacter.lua")
Duel.LoadScript("CookieCharacter.lua")
Duel.LoadScript("CookieCommonEff.lua")
Duel.LoadScript("CookieCommonEff2.lua")
Duel.LoadScript("CookieTrigger.lua")
Duel.LoadScript("StageCommonEff.lua")
Duel.LoadScript("Cookieeffecttype.lua")