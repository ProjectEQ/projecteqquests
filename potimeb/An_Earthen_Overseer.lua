--223108 - An_Earthen_Overseer
--potimeb
--p2 earth


function event_waypoint_arrive(e)
	if(e.wp == 4) then
		eq.signal(223247,1);
	elseif(e.wp == 5) then
		eq.signal(223246,1);
	elseif(e.wp == 6) then
		eq.signal(223123,1);
		eq.spawn2(223134,0,0,160,1352,493,388.0);
		eq.set_timer("depop",1000);
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end
