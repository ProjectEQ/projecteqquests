function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("Welcome to the village of McMannus. We sell many goods. Feel free to look around - just keep your hands to yourself. Good day.");
	elseif(e.message:findi("searching for the fugitive")) then
		e.self:Say("Searching for someone, eh?  You will most likely never find them on the plains.  This is a vast area.  I could have Frostbite help you search.  He is quite good at [tracking prey].");
	elseif(e.message:findi("tracking prey")) then
		e.self:Say("Frostbite can track down anyone, be they man or beast.  All one needs to do is obtain a SWEATY piece of clothing recently worn by the one you seek.");
	end
end

-- END of FILE Zone:qey2hh1  ID:5187 -- Ulrich_McMannus 