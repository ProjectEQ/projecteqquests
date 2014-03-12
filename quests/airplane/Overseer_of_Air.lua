function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("So you have awakened me!! It seems my brother was not much of a challenge. Before we get on to business, there are some matters that must be addressed. But enough talk, let's address these matters first.");
	elseif(e.message:findi("matters")) then
		e.self:Say("The matter at hand is where you are to go after this. I believe that crazy halfling will be showing up. But if by chance he oversleeps, there is some information you should have.");
	elseif(e.message:findi("information")) then
		e.self:Say("You have come to my home. This is also home to the soul carriers and essence harvesters. On the mortal plane, they are still natural enemies, but have learned to live together and are now peaceful creatures here in the Plane of Sky. Be forewarned that as you proceed about your tour, each gate you must reach and pass through will become substantially harder.");
	end
end

function event_death_complete(e)
	eq.spawn2(71060,48,0,-1462.2,-270.1,1250.9,62.9);
end

-------------------------------------------------------------------------------------------------
-- Converted to .lua using MATLAB converter written by Stryd
-- Find/replace data for .pl --> .lua conversions provided by Speedz, Stryd, Sorvani and Robregen
-------------------------------------------------------------------------------------------------
