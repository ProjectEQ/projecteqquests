--Bazu_Smasher (303081)
--2 Bazu Hulk spawn at the described HP numbers
function event_spawn(e)
  eq.set_next_hp_event(90);
end

function event_hp(e)
  local xloc = e.self:GetX();
  local yloc = e.self:GetY();
  local zloc = e.self:GetZ();
  local heading = e.self:GetHeading();
  if (e.hp_event == 90) then
  -- spawn Bazu_Hulk	
    eq.spawn2(303106,0,0,xloc,yloc - 15,zloc,heading);
    eq.spawn2(303106,0,0,xloc,yloc - 15,zloc,heading);
    eq.set_next_hp_event(75);
  elseif (e.hp_event == 75) then
  -- spawn Bazu_Hulk
    eq.spawn2(303106,0,0,xloc,yloc - 15,zloc,heading);
    eq.spawn2(303106,0,0,xloc,yloc - 15,zloc,heading);
    eq.set_next_hp_event(70);
  elseif (e.hp_event == 70) then
  -- spawn Bazu_Hulk
    eq.spawn2(303106,0,0,xloc,yloc - 15,zloc,heading);
    eq.spawn2(303106,0,0,xloc,yloc - 15,zloc,heading);
    eq.set_next_hp_event(55);
  elseif (e.hp_event == 55) then
  -- spawn Bazu_Hulk
    eq.spawn2(303106,0,0,xloc,yloc - 15,zloc,heading);
    eq.spawn2(303106,0,0,xloc,yloc - 15,zloc,heading);
    eq.set_next_hp_event(50);
  elseif (e.hp_event == 50) then
  -- spawn Bazu_Hulk
    eq.spawn2(303106,0,0,xloc,yloc - 15,zloc,heading);
    eq.spawn2(303106,0,0,xloc,yloc - 15,zloc,heading);
    eq.set_next_hp_event(35);
  elseif (e.hp_event == 35) then
  -- spawn Bazu_Hulk
    eq.spawn2(303106,0,0,xloc,yloc - 15,zloc,heading);
    eq.spawn2(303106,0,0,xloc,yloc - 15,zloc,heading);
    eq.set_next_hp_event(30);
  elseif (e.hp_event == 30) then
  -- spawn Bazu_Hulk
    eq.spawn2(303106,0,0,xloc,yloc - 15,zloc,heading);
    eq.spawn2(303106,0,0,xloc,yloc - 15,zloc,heading);
    eq.set_next_hp_event(15);
  elseif (e.hp_event == 15) then
  -- spawn Bazu_Hulk
    eq.spawn2(303106,0,0,xloc,yloc - 15,zloc,heading);
    eq.spawn2(303106,0,0,xloc,yloc - 15,zloc,heading);
    eq.set_next_hp_event(10);
  elseif (e.hp_event == 10) then
  -- spawn Bazu_Hulk
    eq.spawn2(303106,0,0,xloc,yloc - 15,zloc,heading);
    eq.spawn2(303106,0,0,xloc,yloc - 15,zloc,heading);
  end
end
