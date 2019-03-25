--This version of Shei is a simple non-aggro merchant. When killed, the true version of Shei will spawn.

function event_death_complete(e)
	eq.spawn2(179032,0,0,-1736,1082,22.6,126); -- NPC: #Shei_Vinitras
	eq.spawn2(179174,0,0,-1769,1038,17.13,126); -- NPC: #Diabo_Tatrua
	eq.spawn2(179181,0,0,-1769,1056,17.13,126); -- NPC: #Tavuel_Tatrua
	eq.spawn2(179164,0,0,-1769,1084,17.42,126); -- NPC: #Thall_Tatrua
	eq.spawn2(179173,0,0,-1769,1116,17.13,126); -- NPC: #Va_Tatrua
end

--Submitted by Jim Mills
--Modified by Reno
-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
