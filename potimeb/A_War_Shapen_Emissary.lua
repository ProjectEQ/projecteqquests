
function event_waypoint_arrive(e)
	if(e.wp == 4) then
		eq.signal(223141,1);
	elseif(e.wp == 5) then
		eq.signal(223148,1);
	elseif(e.wp == 6) then
		eq.signal(223136,1);
		eq.spawn2(223096,0,0,132.82,867.30,493.15,388.2);
		eq.set_timer("depop",1000);
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end
