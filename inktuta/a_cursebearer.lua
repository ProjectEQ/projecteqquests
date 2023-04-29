function event_waypoint_arrive(e)
	e.self:Emote("approaches, and Jomica meets with an unfortunate fate...");
	eq.signal(296037,2); -- Kill Jom
	eq.depop();
end

function event_death_complete(e)
	eq.signal(296037,1); -- Save Jom
end

function event_spawn(e)
	e.self:MoveTo(-489,-912,-129.12,386,true);
end
