function event_waypoint_arrive(e)
	if(e.wp == 4) then
		eq.signal(223143,1);
	elseif(e.wp == 5) then
		eq.signal(223124,1);
	elseif(e.wp == 6) then
		eq.signal(223137,1);
		eq.spawn2(223146,0,0,125.73,572.79,493.53,388.0);
		eq.set_timer("depop",1000);
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end
