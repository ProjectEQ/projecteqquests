function event_waypoint_arrive(e)
  if(e.wp == 12) then
    e.self:Say("Guard, stand up straight!");
    eq.signal(1002,1);
    eq.signal(1181,1);
  elseif(e.wp == 28) then
    e.self:Say("Guard, stand up straight!");
    eq.signal(1090,1);
    eq.signal(1091,1);
  elseif(e.wp == 38) then
    e.self:Say("Guard, stand up straight!");
    eq.signal(1001,1);
    eq.signal(1189,1);
    eq.signal(1006,1);
    eq.signal(1174,1);
  end
end  
