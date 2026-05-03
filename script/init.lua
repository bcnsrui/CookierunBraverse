-- Keep compatibility with environments that resolve script roots differently.
pcall(Duel.LoadScript,"CS_init.lua")
if not Cookie2 then
	pcall(Duel.LoadScript,"expansions/script/CS_init.lua")
end
if not Cookie2 then
	pcall(Duel.LoadScript,"CookieMainCharacter.lua")
	pcall(Duel.LoadScript,"CookieCharacter.lua")
	pcall(Duel.LoadScript,"CookieCommonEff.lua")
	pcall(Duel.LoadScript,"CookieCommonEff2.lua")
	pcall(Duel.LoadScript,"CookieCommonEff3.lua")
	pcall(Duel.LoadScript,"Cookieeffecttype.lua")
end