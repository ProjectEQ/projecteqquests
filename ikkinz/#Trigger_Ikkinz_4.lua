-- 294614
local doorman_1 = nil;
local doorman_2 = nil;
local doorman_3 = nil;
local doorman_4 = nil;
local doorman_5 = nil;
local doorman_6 = nil;
local doorman_7 = nil;
local doorman_8 = nil;

function event_spawn(e)
  doorman_1 = eq.spawn2(294632, 0, 0, 218, -336, -2.77, 0.00);
  doorman_2 = eq.spawn2(294632, 0, 0, 90, -412, -2.77, 0.00);

  doorman_3 = eq.spawn2(294632, 0, 0, 240, -496, -2.87, 0.00);
  doorman_4 = eq.spawn2(294632, 0, 0, 496, -501, -50, 0.00);

  doorman_5 = eq.spawn2(294632, 0, 0, 499, -478, -50, 0.00);
  --doorman_6 = eq.spawn2(294632, 0, 0, 722, -716, -50, 0.00);

  doorman_7 = eq.spawn2(294632, 0, 0, 656, -237, -50, 0.00);
  doorman_8 = eq.spawn2(294632, 0, 0, 656, -187, -50, 0.00);

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
  if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(294591) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(294592) == false) then
    if (doorman_1 ~= nil) then 
      doorman_1:Depop();
    end
    if (doorman_2 ~= nil) then
      doorman_2:Depop();
    end
  end

  if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(294602) == false and eq.get_entity_list():IsMobSpawnedByNpcTypeID(294603) == false) then
    if (doorman_3 ~= nil) then 
      doorman_3:Depop();
    end
  end

  if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(294604) == false ) then
    if (doorman_4 ~= nil) then
      doorman_4:Depop();
    end
    if (doorman_5 ~= nil) then
      doorman_5:Depop();
    end
  end

  if (eq.get_entity_list():IsMobSpawnedByNpcTypeID(294613) == false ) then
    if (doorman_7 ~= nil) then
      doorman_7:Depop();
    end
    if (doorman_8 ~= nil) then
      doorman_8:Depop();
    end
  end

end
