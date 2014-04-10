function event_signal(e)
	-- signal to depop from Fergul Frostsky once he reached the end of his path (waypoint 6)
	if(e.signal == 1) then
		eq.depop();
	end
end
