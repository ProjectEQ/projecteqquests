local kill_count = 0

local function zone_death(e)
  -- kills count even for drakes (any _Delve_ names probably)
  if kill_count < 30 and not e.killed:IsPet() then
    kill_count = kill_count + 1
    eq.debug("kill count: " .. kill_count)
    if kill_count == 10 or kill_count == 20 then
      eq.zone_emote(MT.Yellow, "The goblin falls before being able to sound the alarm")
    elseif kill_count == 30 then
      eq.zone_emote(MT.Yellow, "As the Delvian falls to the ground you can hear a siren going off. Your presence has been made known. Quickly find the Goblin Task Master for the information you seek.")
      eq.unique_spawn(342046, 0, 0, -156, 1620, 4, 1) -- #Goblin_Task_Master
    end
  end
end

local function task_master_death(e)
  -- todo: this should probably be a spawn condition to handle randomness of class types
  local guards = { 342047, 342048, 342049, 342050 } -- a_Delve_guard
  eq.spawn2(guards[math.random(#guards)], 0, 0, -155, 1464, 3, 509)
  eq.spawn2(guards[math.random(#guards)], 0, 0, -131, 1470, 3, 459)
  eq.spawn2(guards[math.random(#guards)], 0, 0, -179, 1468, 3, 49)
  eq.spawn2(guards[math.random(#guards)], 0, 0, -154, 1051, 3, 508)
  eq.spawn2(guards[math.random(#guards)], 0, 0, -144, 1019, 3, 510)
  eq.spawn2(guards[math.random(#guards)], 0, 0, -167, 1018, 3, 507)
  eq.spawn2(guards[math.random(#guards)], 0, 0, -153, 471, 3, 507)
  eq.spawn2(guards[math.random(#guards)], 0, 0, -140, 453, 3, 507)
  eq.spawn2(guards[math.random(#guards)], 0, 0, -164, 452, 3, 507)
end

function event_encounter_load(e)
  eq.register_npc_event(Event.death_zone,     10,     zone_death) -- zone_controller
  eq.register_npc_event(Event.death_complete, 342046, task_master_death) -- #Goblin_Task_Master
end
