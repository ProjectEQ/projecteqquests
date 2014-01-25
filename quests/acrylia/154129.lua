-- Khati Sha Event
-- Succed grimling
-- Signal upon death to Arcanist V2. Start next part of event.
-- Created by Gonner
-- Converted to .lua by Speedz

function event_death_complete(e)
	eq.signal(154151,9,10); -- sends signal to arcanist V1
end
