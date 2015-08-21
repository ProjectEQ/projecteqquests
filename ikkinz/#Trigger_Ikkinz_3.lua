-- 294597
-- #Trigger_Ikkinz_3
local counter = 0;
local el = nil;

function event_spawn(e)
  counter = 0;

  eq.spawn2(294632, 0, 0, 726, -713, -50, 193);
  eq.spawn2(294632, 0, 0, 659, -213, -50, 60);

  eq.set_timer("checkdoors", 5 * 1000);
end

function event_signal(e)
  if (e.signal == 1) then
    counter = counter + 1;
  elseif (e.signal == 9) then
    el = eq.get_entity_list();

    if ( el:IsMobSpawnedByNpcTypeID(294590) == false and 
         el:IsMobSpawnedByNpcTypeID(294587) == false and 
         el:IsMobSpawnedByNpcTypeID(294588) == false and 
         el:IsMobSpawnedByNpcTypeID(294509) == false and 
         el:IsMobSpawnedByNpcTypeID(294589) == false ) then
      eq.depop_all(294632);
    end
  end

  if (counter == 4) then
    eq.spawn2(294594,0,0,534,-210,-50, 72);
  end
end

function event_timer(e)
  if (e.timer == "checkdoors") then 
    eq.stop_timer(e.timer);

  end
end
