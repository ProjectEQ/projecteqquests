function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there. adventurer! I am sure you are thirsty after that long boat ride from Qeynos!");
	end
end

function event_signal(e)
	e.self:Say("Pipe down, Phloatin! Treat the new clientele with respect.");
end

-- END of FILE Zone:erudnext  ID:98065 -- Helia_BlueHawk