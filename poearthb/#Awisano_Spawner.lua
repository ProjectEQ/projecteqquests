function event_spawn(e)
	eq.set_timer("spawn", 6000);
end

function event_timer(e)
	if (e.timer == "spawn") then
			eq.stop_timer("spawn");
			eq.spawn2(222002, 0, 0, 292, 248, -14.5, 449); -- NPC: A_Myrmidon_of_Stone
			eq.spawn2(222002, 0, 0, 290, 312, -14.5, 320); -- NPC: A_Myrmidon_of_Stone
			eq.spawn2(222002, 0, 0, 225.5, 245.3, -14.5, 67.75); -- NPC: A_Myrmidon_of_Stone
			eq.spawn2(222002, 0, 0, 221, 319, -14.5, 192); -- NPC: A_Myrmidon_of_Stone
 	end 
end
