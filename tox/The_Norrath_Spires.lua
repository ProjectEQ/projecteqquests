function event_spawn(e)
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 120, xloc + 120, yloc - 120, yloc + 120);
end

function event_enter(e)
	eq.set_global("spire_tox","1",1,"F"); -- when we enter the spires, set global true.
end

function event_exit(e)
	eq.del_global("spire_tox");
end

function event_signal(e)
	if e.signal == 101 then
		eq.SelfCast(2935); -- flavor
	end
end