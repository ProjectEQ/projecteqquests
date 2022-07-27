--A_Windshapen_Warlord_of_Air (223144)
--Phase 2 Undead Controller
--potimeb

function event_waypoint_arrive(e)
	if(e.wp == 4) then
		eq.signal(223099,1);
	elseif(e.wp == 5) then
		eq.signal(223125,1);
	elseif(e.wp == 6) then
		eq.signal(223102,1);
		eq.spawn2(223118,0,0,136.6,1639.59,493.29,388.0);
		eq.set_timer("depop",1000);
	end
end

function event_timer(e)
	if e.timer == "depop" then
		eq.depop();
	end
end
