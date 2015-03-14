function event_waypoint_arrive(e)
  if(e.wp == 23) then
    local xloc = e.self:GetX();
	local yloc = e.self:GetY();
	eq.set_proximity(xloc - 40, xloc + 40, yloc - 40, yloc + 40);
  elseif(e.wp == 1) then
    eq.clear_proximity();
  end
 end
 
 function event_enter(e)
   eq.SelfCast(2289);
 end
