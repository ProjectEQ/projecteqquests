-- Khati Sha Event
-- Fail
-- Created by Gonner
-- Converted to .lua by Speedz

local event_counter;

function event_signal(e)

	if(e.signal == 8) then

		event_counter = event_counter + 1;

		if(event_counter == 5) then
			eq.signal(154130,4,20); -- Signals WDTrpMn that the event has failed and to end the event.
		end
	elseif(e.signal == 7) then
		eq.depop();
	end
end

function event_death_complete(e)
	eq.signal(154130,4,10); -- Spawn raid Version of Spiritual Arcanist Ends Event
end
