-- Khati Sha Event
-- Succed
-- Created by Gonner
-- Converted to .lua by Speedz

local event_counter;

function event_spawn(e)
	event_counter = 0;
end

function event_death_complete(e)
	eq.signal(154130,4,10); -- Spawn raid Version of Spiritual Arcanist Ends Event
end

function event_signal(e)

	if(e.signal == 9) then

		event_counter = event_counter + 1;

		if(event_counter == 5) then
			eq.signal(154130,3,20); -- Signals WDTrpMn that the event has succeded and to start next part.
		end
	end

	if(e.signal == 6) then
		e.self:DoAnim(16);
	end

	if(e.signal == 7) then
		eq.depop();
	end
end
