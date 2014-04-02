function event_signal(e)
	if(e.signal == 1) then
		eq.stop();
	elseif(e.signal == 2) then
		eq.start(58);
	end
end

function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Go to the taverns if you're looking for talk.");
	end
end
