function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("I am not the begining.");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("Middle and end.");
	end
end
