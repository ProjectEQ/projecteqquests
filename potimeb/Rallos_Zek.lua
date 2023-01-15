-- Fake RZ (223001)
local event_counter = 0;

function event_signal(e)
	-- signal 1 comes from my army
	if (e.signal == 1) then
		event_counter = event_counter + 1;
		if (event_counter == 12) then
			-- spawn real Rallos
			eq.spawn2(223168,0,0,264,-279,18.75,435);
			eq.signal(223097,223001); -- Add Trash Lockout
			-- make myself go away!
			eq.depop();
		end
	end
end
