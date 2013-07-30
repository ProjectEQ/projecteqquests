-- NPCID 223101
function event_spawn(e)
	-- create a proximty to check for a player to arrive.
	local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 100, xloc + 100, yloc - 100, yloc + 100);
end

function event_enter(e)
	eq.clear_proximity();
	-- tell quarm to start pathing
	eq.signal(223201,1);
	-- depop my job is done.
	eq.depop();
end
