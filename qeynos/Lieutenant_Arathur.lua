function event_waypoint_arrive(e)
  if(e.wp == 12) then
    e.self:Say("Guard, stand up straight!");
    eq.signal(1002,1); -- NPC: Guard_Jerith
    eq.signal(1181,1); -- NPC: Guard_Dunix
  elseif(e.wp == 28) then
    e.self:Say("Guard, stand up straight!");
    eq.signal(1090,1); -- NPC: Guard_Beren
    eq.signal(1091,1); -- NPC: Guard_Corshin
  elseif(e.wp == 38) then
    e.self:Say("Guard, stand up straight!");
    eq.signal(1001,1); -- NPC: Guard_Mezzt
    eq.signal(1189,1); -- NPC: Guard_Phaeton
    eq.signal(1006,1); -- NPC: Guard_Cyrillian
    eq.signal(1174,1); -- NPC: Guard_Forbly
  end
end  
