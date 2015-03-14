function event_say(e)
	if(e.message:findi("lion roast")) then
		e.self:Say("Hello there. You are here to deliver the lion roast to Halas? Very well, here is the lion roast.");
		e.other:SummonItem(12221);
	end
end

-- END of FILE Zone:qey2hh1  ID:3563 -- Misla_McMannus 