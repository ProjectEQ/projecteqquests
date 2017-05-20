--Bazu_Smasher (303081)
--2 Bazu Hulk spawn at the described HP numbers
function event_combat(e)
  if (e.joined == true) then
    eq.set_next_hp_event(90);
    eq.stop_timer('wipecheck');
	eq.set_timer("breath", math.random(3,8) * 1000);
	eq.set_timer("stomp", math.random(10,15) * 1000);
  else
    eq.set_timer('wipecheck', 300 * 1000);
	eq.stop_timer('breath');
	eq.stop_timer('stomp');
  end
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

function event_timer(e)
  if (e.timer == 'wipecheck') then
     eq.depop_all(303106);
     eq.spawn2(303081, 0, 0, 1753.99, 1788, 316.853, 164.375);
	 eq.depop();
     eq.stop_timer('wipecheck');
  elseif e.timer=="breath" then
     e.self:CastSpell(5559,e.self:GetTarget():GetID());
	 eq.set_timer("breath", 30*1000);
  elseif e.timer=="stomp" then
     e.self:CastSpell(5558,e.self:GetTarget():GetID());
	 eq.set_timer("stomp", 30*1000);
  end
end

