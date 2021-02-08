function event_spawn(e)
	eq.set_timer("timecheck", 10000);
end

function event_timer(e)
	if ( e.timer == "timecheck" ) then
		local zone_time = eq.get_zone_time();

    		if(zone_time["zone_hour"] == 7 or zone_time["zone_hour"] == 19) then
	
			eq.zone_emote(0, "You hear a chime in the distance, and a voice booms in your ears, 'It is now the time for the changing of the guard!'");
			eq.stop_timer("timecheck");
			eq.set_timer("pause", 5 * 60 * 1000);
			eq.spawn2(eq.ChooseRandom(211112,211002),33,0,109,17,3,126);
			eq.spawn2(eq.ChooseRandom(211112,211002),34,0,109,17,3,126);
			eq.spawn2(eq.ChooseRandom(211113,211114),35,0,109,17,3,126);
			eq.spawn2(eq.ChooseRandom(211113,211114),36,0,109,17,3,126);
		end
	elseif ( e.timer == "pause" ) then
			eq.stop_timer("pause");
			eq.set_timer("timecheck", 10 * 1000);
	end
end
