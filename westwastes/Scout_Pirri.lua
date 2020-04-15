	-- Cleric 1.5 Epic Quest // Harmony of the Soul // --Drogerin
	
function event_say(e)
	local qglobals = eq.get_qglobals(e.other);
	if(qglobals["cleric_epic"] >= "5" and e.message:findi("hail")) then
		e.self:Say("You are here to \"help\"? I think not. I will not share my glory with anyone. The only way you will get this is by prying it from the clasped fingers of my dead hand");
		eq.depop_with_timer();
		eq.spawn2(120112,0,0,2307,889,-21.875,306); -- NPC: #Scout_Pirri
	end
end	
