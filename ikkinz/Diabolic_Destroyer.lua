-- Ikkinz Group 1 Expedition
-- Diabolic_Destroyer NPCID: 294043

function event_spawn(e)
  set_event_start();
end

function event_hp(e)
  local xloc = e.self:GetX();
  local yloc = e.self:GetY();
  local zloc = e.self:GetZ();
  local heading = e.self:GetHeading();
  -- spawn #Dire_Illusion x2
  eq.spawn2(294137,0,0,xloc,yloc + 25,zloc,heading);
  eq.spawn2(294137,0,0,xloc,yloc - 25,zloc,heading);
  -- set next HP event threshold
  if (e.hp_event == 76) then
    eq.set_next_hp_event(51);
  elseif (e.hp_event == 51) then
    eq.set_next_hp_event(26);
  end
end

function event_combat(e)
  if (e.joined) then
    -- /loc updated from MySEQ capture 2014/01/26
    eq.spawn2(294137,0,0,418.5914,-179.3205,10.502,192);
    eq.spawn2(294137,0,0,418.5914,-94.3507,10.502,192);
    eq.spawn2(294137,0,0,379.2154,-186.3592,1.502002,256);
  else
    if (e.self:GetHP() < e.self:GetMaxHP()) then
      e.self:SetHP(e.self:GetMaxHP());
    end
    set_event_start();
  end
end

function event_death_complete(e)
  -- depop the Dire_Illusions
  eq.depop_all(294137);
  -- spawn the Cruel_Illusion
  eq.spawn2(294136,0,0,442,-141,11,192);

  --set lockout
  local instance_id = eq.get_zone_instance_id();
  local charid_list = eq.get_characters_in_instance(instance_id);
  local instance_requests = require("instance_requests")
  
  for k,v in pairs(charid_list) do
    eq.target_global("lockout_ikky_g1", tostring(instance_requests.GetLockoutEndTimeForHours(17)), "H17", 0,v, 0);
  end

end

function set_event_start()
  eq.depop_all(294137);
  eq.set_next_hp_event(76);
end
