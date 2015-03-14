function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Hello there. " .. e.other:GetName() .. ". I sell the Rivervale Voice. It's our local newspaper and has all the news a halfling needs to know.");
	end
end

-- END of FILE Zone:rivervale  ID:19037 -- Teelie_Meegles 

