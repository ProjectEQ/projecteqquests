local extra_loot;
local QOS_Inactive = "18,1^19,1^20,1^21,1^24,1^25,1";
local QOS_Active = "1,1,6000,100^4,1,20,0,25^7,1^13,1^14,1^15,1^17,1^31,1^21,1^42,1"
local instance_id;
local raid_list;
local QOS;
local instance_requests = require("instance_requests"); 

function QOS_Spawn(e)
  instance_id = eq.get_zone_instance_id();
  raid_list = eq.get_characters_in_instance(instance_id);
  
  extra_loot = false;
  eq.set_next_hp_event(20);

  QOS = e.self;
end

function QOS_HP(e)
  if (e.hp_event == 20) then
    -- if the 4 mini's are stillup then disable the QOS till they are dead
    local entity_list = eq.get_entity_list();
    if (entity_list:IsMobSpawnedByNpcTypeID(241058)) then
      extra_loot = true;
    end

    if (entity_list:IsMobSpawnedByNpcTypeID(241058) or entity_list:IsMobSpawnedByNpcTypeID(241053) or entity_list:IsMobSpawnedByNpcTypeID(241046) or entity_list:IsMobSpawnedByNpcTypeID(241051)) then
      -- disable the QOS till the minis are dead
      e.self:ProcessSpecialAbilities(QOS_Inactive); 
      e.self:WipeHateList();  
      e.self:SetOOCRegen(0);  
    end
  end
end

function Mini_Death(e)
  local entity_list = eq.get_entity_list();
  if (entity_list:IsMobSpawnedByNpcTypeID(241058) == false and entity_list:IsMobSpawnedByNpcTypeID(241053) == false and entity_list:IsMobSpawnedByNpcTypeID(241046) == false and entity_list:IsMobSpawnedByNpcTypeID(241051) == false) then
    QOS:ProcessSpecialAbilities(QOS_Active); 
  end
end

function UpdateLockout()
  local lockout_name = 'takc';
  for k,v in pairs(raid_list) do                                                                             
    eq.target_global(lockout_name, tostring(instance_requests.GetLockoutEndTimeForHours(108)), "H108", 0,v, 0);
  end                                                                                                          
end

function QOS_Death(e)

  if (extra_loot) then
    -- Ritanas_Ornate_Chest
    eq.spawn2(241075, 0, 0, 379, -797, 8.23, 0.5);
  end
  --
  -- The Earthen Chest
  eq.spawn2(241076, 0, 0, 448, -727, 8.23, 192.5);
  -- The Gem Encrusted Chest
  eq.spawn2(241077, 0, 0, 309, -727, 8.23, 65);
  
  UpdateLockout();
end

function event_encounter_load(e)
  eq.register_npc_event('takc', Event.death_complete, 241058, RTC_Death);
  eq.register_npc_event('takc', Event.death_complete, 241053, Mini_Death);
  eq.register_npc_event('takc', Event.death_complete, 241046, Mini_Death);
  eq.register_npc_event('takc', Event.death_complete, 241051, Mini_Death);
  eq.register_npc_event('takc', Event.death_complete, 241052, QOS_Death);

  eq.register_npc_event('takc', Event.hp,             241052, QOS_HP);
  eq.register_npc_event('takc', Event.spawn,          241052, QOS_Spawn);
  eq.register_npc_event('takc', Event.signal,         241052, QOS_Signal);
end
