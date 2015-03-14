function event_signal(e)
	-- signal sent by shardwurm broodmother to start gridid 58 (one way depop) and run
	if(e.signal == 1) then
		e.self:SetRunning(true);
		eq.start(58);
	end
end

function event_waypoint_arrive(e)
	-- if reached the end of his path(waypoint 6 from gridid 58), send signal to shardwurm to depop with timer and Gralk to depop.
	if(e.wp == 6) then
		eq.signal(118208,1); -- #Gralk_Dwarfkiller
		eq.signal(118040,1); -- shardwurm_broodmother
	end
end

function event_death_complete(e)
	-- upon death, send signal to shardwurm to depop with timer and Gralk to depop.
	eq.signal(118208,1);
	eq.signal(118040,1);
end
