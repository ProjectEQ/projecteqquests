function event_spawn(e)
	eq.set_timer("spawn", 6000);
end

function event_timer(e)
	if (e.timer == "spawn") then
			eq.stop_timer("spawn");
			eq.spawn2(222000, 0, 0, 22, 78, -14.5, 193);
			eq.spawn2(222000, 0, 0, 99, 1, -14.5, 450);
			eq.spawn2(222000, 0, 0, 98, 78, -14.5, 320);
			eq.spawn2(222000, 0, 0, 20, 1, -14.5, 65);
 	end
end
