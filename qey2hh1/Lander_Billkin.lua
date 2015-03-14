function event_spawn(e)
	e.self:SetRunning(true);
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("No time to talk!! I must be on my way. I am in a race with the paladins from the Temple of Life.");
	end
end
