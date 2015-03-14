-- Khati Sha Event
-- Fail grimling
-- Signal upon death to Arcanist V1. When 4 die event is over.
-- Created by Gonner
-- Converted to .lua by Speedz

function event_death_complete(e)
	eq.signal(154152,8,10); -- sends signal to arcanist V1
end
