-- Fake Inny (223000)
local event_counter = 0;

function event_signal(e)
	-- signal 1 comes from my army
	if (e.signal == 1) then
		event_counter = event_counter + 1;
		if (event_counter == 12) then
			-- spawn real Innoruuk
			eq.spawn2(223167,0,0,303.3,306,13.3,323);
			eq.signal(223097,223000); -- Add Trash Lockout
			-- make myself go away!
			eq.depop();
		end
	end
end
