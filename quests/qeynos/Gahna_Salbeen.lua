function event_signal(e)
	if(e.signal == 1) then
		eq.stop();
	elseif(e.signal == 2) then
		eq.start(57);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Greetings. This is a grand city. I plan to make much profit here.");
	end
end
