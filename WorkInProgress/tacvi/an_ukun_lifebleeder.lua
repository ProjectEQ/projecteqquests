-- Add during PXK fight

function event_spawn(e)
	e.self:Emote("flesh and bone are reformed by dark magic");
end

function event_death_complete(e)
	-- On Death, signal the controller that we have died so the controller can keep track of the number of spawns.
	eq.signal(298222, 298043, 0);
end
