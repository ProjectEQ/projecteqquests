-- #Trigger_Ikkinz_4
-- 294614
local doorman_1 = nil;
local doorman_2 = nil;
local doorman_3 = nil;
local doorman_4 = nil;
local doorman_5 = nil;
local doorman_6 = nil;
local doorman_7 = nil;

local instance_id = nil;
local stone_counter = 0;

function event_spawn(e)
  instance_id = eq.get_zone_instance_id();

  stone_counter = 0;

  doorman_1 = eq.spawn2(294632, 0, 0, 218, -336, -2.77, 0.00);
  doorman_2 = eq.spawn2(294632, 0, 0, 90, -412, -2.77, 0.00);

  doorman_3 = eq.spawn2(294633, 0, 0, 240, -496, -2.87, 0.00);

  doorman_4 = eq.spawn2(294634, 0, 0, 496, -501, -50, 0.00);
  doorman_5 = eq.spawn2(294634, 0, 0, 499, -478, -50, 0.00);

  doorman_6 = eq.spawn2(294635, 0, 0, 656, -237, -50, 0.00);
  doorman_7 = eq.spawn2(294635, 0, 0, 656, -187, -50, 0.00);

  eq.spawn2(294636, 0, 0, 719, -730, -50, 188);
  eq.spawn2(294636, 0, 0, 719, -700, -50, 188);
  
  -- Set a timer to check the zone; this is needed
  -- in case the zone crashes to reset the doormen 
  -- properly.  Can't reliably do a entity check as 
  -- the zone is booting up; so we'll do the check 5 sec 
  -- after it boots up; all the mobs should be spawned by 
  -- then.
  eq.set_timer("checkdoors", 5 * 1000 );
end

function event_timer(e)

  if (e.timer == "checkdoors") then
    eq.stop_timer(e.timer);
    eq.signal(294614, 1);
  end

end

function event_signal(e)
  -- When Altar Wardens are dead; remove the bouncers blocking
  -- the Alter Sentrys
  if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(294591) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(294592) == false) then
    eq.depop_all(294632);
  end

  -- When the Altar Sentrys are dead; remove the bouncer blocking
  -- the Altar Overseeer
  if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(294602) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(294603) == false) then
    eq.depop_all(294633);
  end

  -- When the Altar Overseer is dead; remove the bouncers blocking
  -- the door into the 3 stall room
  if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(294604) == false ) then
    eq.depop_all(294634);
    eq.set_proximity(e.self:GetX()-50, e.self:GetX()+50, e.self:GetY()-70, e.self:GetY()+70);
    eq.enable_proximity_say();
  end

  -- When the Oracle of the Altar is dead; remove the bouncers blocking
  -- the Altar Construct
  if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(294613) == false ) then
    eq.depop_all(294635);
  end

  if (e.signal == 294611) then
    stone_counter = stone_counter + 1;
    if (stone_counter >= 2) then
      eq.signal(294611, 1);
    end
  end
end

function event_proximity_say(e)
  if (e.message:findi("return")) then
    e.other:MovePCInstance(294, instance_id, 500, -615, -50, 286 );
  end
end
