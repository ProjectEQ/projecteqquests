function event_waypoint_arrive(e)
	if(e.wp == 14) then
		local xloc = e.self:GetX();
		local yloc = e.self:GetY();
		eq.set_proximity(xloc - 40, xloc + 40, yloc - 40, yloc + 40);
	elseif(e.wp == 15) then
		eq.clear_proximity();
	end
end
 
function event_enter(e)
	e.self:Emote("'s spirit moves you to another land ...");
	eq.SelfCast(2279);
end