function event_say(e)
	if(e.message:findi("hail")) then
		e.self:Say("It is staring at me again!  I should pluck its eyeballs out!");
	elseif(e.message:findi("staring")) then
		e.self:Say("The cave bear in the corner of course.");
	elseif(e.message:findi("not")) then
		e.self:Say("Are you blind " .. e.other:Race() .. "? It's Huge! Look at the claws on it! It is the bear that ate Dlemin.It's hungry too, just waiting for me to sleep.");
	elseif(e.message:findi("sleep")) then
		e.self:Say("No! I will not sleep! It will eat me! I will stay awake forever! Forever I tell you!");
	end
end

function event_signal(e)
	if(e.signal == 1) then
		e.self:Say("The cave bear in the corner of course!");
	end
end
