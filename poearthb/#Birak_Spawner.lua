function event_spawn(e)
	eq.set_timer("spawn", 6000);
end

function event_timer(e)
	if (e.timer == "spawn") then
			eq.stop_timer("spawn");
			eq.spawn2(222001, 0, 0, -12, 352, -14.5, 193); -- NPC: A_Stonefist_Clansman
			eq.spawn2(222001, 0, 0, 52, 285, -14.5, 450); -- NPC: A_Stonefist_Clansman
			eq.spawn2(222001, 0, 0, 58, 356, -14.5, 320); -- NPC: A_Stonefist_Clansman
			eq.spawn2(222001, 0, 0, -13, 286, -14.5, 65); -- NPC: A_Stonefist_Clansman
 	end
end
