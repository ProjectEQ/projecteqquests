function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello, most honored guest. I hope all is going well with you and that everything here is to your satisfaction.");
	end
end
