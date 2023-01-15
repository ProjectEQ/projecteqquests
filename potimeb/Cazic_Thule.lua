-- Fake CT (223165)
local event_counter = 0;

function event_signal(e)
	-- signal 1 comes from my army
	if (e.signal == 1) then
		event_counter = event_counter + 1;
		if (event_counter == 12) then
			-- spawn real Cazic
			eq.spawn2(223166,0,0,-257,255,6,203);
			eq.signal(223097,223165); -- Add Trash Lockout
			-- make myself go away!
			eq.depop();
		end
	end
end
