-- 10th Ring War
-- Great Divide
-- 118167 Zrelik the Scout
--
-- When Event Starts:
-- - Zone Depops
-- - Extra Dwarf Defenders spawn to guard TODO: make these dwarves 
--   Player controalable.
-- - 13 waves of mobs will spawn in succession; each wave will have 
--   a wave master (Captain, General, Warlord) when the wave master 
--   dies; it will start a timer (5min) before the next wave spawns
-- - 14th wave is just Narandi.
-- - There are three locations in which the giants will spawn and
--   start pathing twards Thurgadin.
--
-- Fail Conditions:
-- - Any Giant reaches the final waypoint of their pathing (which is 
--   near Thurgain).
-- - Seneschal Aldikan dies
--

local current_wave_number;

-- This variable controls the time between waves; currently 5min.
local wave_cooldown_time = 5 * 60 * 1000;

function Stop_Event()
  -- Condition 1 is the general mobs in the zone
  eq.spawn_condition("greatdivide", 0, 1, 1);
  eq.spawn_condition("greatdivide", 0, 2, 0);
  eq.spawn_condition("greatdivide", 0, 3, 0);
  eq.spawn_condition("greatdivide", 0, 4, 0);
  eq.spawn_condition("greatdivide", 0, 5, 0);
  eq.spawn_condition("greatdivide", 0, 6, 0);
  eq.spawn_condition("greatdivide", 0, 7, 0);
  eq.spawn_condition("greatdivide", 0, 8, 0);
  eq.spawn_condition("greatdivide", 0, 9, 0);
  eq.spawn_condition("greatdivide", 0, 10, 0);
  eq.spawn_condition("greatdivide", 0, 11, 0);
  eq.spawn_condition("greatdivide", 0, 12, 0);
  eq.spawn_condition("greatdivide", 0, 13, 0);
  eq.spawn_condition("greatdivide", 0, 14, 0);
  eq.spawn_condition("greatdivide", 0, 15, 0);
  eq.spawn_condition("greatdivide", 0, 16, 0);
  eq.spawn_condition("greatdivide", 0, 17, 0);
  eq.spawn_condition("greatdivide", 0, 18, 0);
  eq.spawn_condition("greatdivide", 0, 19, 0);
  eq.spawn_condition("greatdivide", 0, 20, 0);
  eq.spawn_condition("greatdivide", 0, 21, 0);
end

function Ten_Start(e)
  -- The first spawn condition to work with is 3; so 
  -- if we reset the event; we need to reset this to 3
  current_spawn_condition = 3;

  -- Reset all the spawn conditions to a clean state.
  Stop_Event();
end

function Zrelik_Say(e)
  if (e.other:Admin() >= 80 and e.other:GetGM()) then
    if (e.message:findi('end')) then
      Stop_Event();

    elseif (e.message:findi('start')) then
      eq.zone_emote(13, "and so it begins...");
      eq.spawn_condition("greatdivide", 0, 1, 0);
      eq.spawn_condition("greatdivide", 0, 2, 1);

      -- Signal the ringtemmaster to spawn the first wave...
      eq.signal(118173, 1);

    elseif (e.message:findi('wave 14')) then
      eq.zone_emote(15, "Wave 14");
      eq.spawn_condition("greatdivide", 0, 16, 1);
    elseif (e.message:findi('wave 13')) then
      eq.zone_emote(15, "Wave 13");
      eq.spawn_condition("greatdivide", 0, 15, 1);
    elseif (e.message:findi('wave 12')) then
      eq.zone_emote(15, "Wave 12");
      eq.spawn_condition("greatdivide", 0, 14, 1);
    elseif (e.message:findi('wave 11')) then
      eq.zone_emote(15, "Wave 11");
      eq.spawn_condition("greatdivide", 0, 13, 1);
    elseif (e.message:findi('wave 10')) then
      eq.zone_emote(15, "Wave 10");
      eq.spawn_condition("greatdivide", 0, 12, 1);
    elseif (e.message:findi('wave 1')) then
      eq.zone_emote(15, "Wave 1");
      eq.spawn_condition("greatdivide", 0, 3, 1);
    elseif (e.message:findi('wave 2')) then
      eq.zone_emote(15, "Wave 2");
      eq.spawn_condition("greatdivide", 0, 4, 1);
    elseif (e.message:findi('wave 3')) then
      eq.zone_emote(15, "Wave 3");
      eq.spawn_condition("greatdivide", 0, 5, 1);
    elseif (e.message:findi('wave 4')) then
      eq.zone_emote(15, "Wave 4");
      eq.spawn_condition("greatdivide", 0, 6, 1);
    elseif (e.message:findi('wave 5')) then
      eq.zone_emote(15, "Wave 5");
      eq.spawn_condition("greatdivide", 0, 7, 1);
    elseif (e.message:findi('wave 6')) then
      eq.zone_emote(15, "Wave 6");
      eq.spawn_condition("greatdivide", 0, 8, 1);
    elseif (e.message:findi('wave 7')) then
      eq.zone_emote(15, "Wave 7");
      eq.spawn_condition("greatdivide", 0, 9, 1);
    elseif (e.message:findi('wave 8')) then
      eq.zone_emote(15, "Wave 8");
      eq.spawn_condition("greatdivide", 0, 10, 1);
    elseif (e.message:findi('wave 9')) then
      eq.zone_emote(15, "Wave 9");
      eq.spawn_condition("greatdivide", 0, 11, 1);
    end
  end
end

function Master_Signal(e)

  if (e.signal == 1) then
    eq.spawn_condition("greatdivide", 0, 3, 1);

  elseif (e.signal == 2) then 
    eq.set_timer('wave_cooldown', wave_cooldown_time);

  end

end

function Master_Timer(e)
  if (e.timer == 'wave_cooldown') then
    eq.stop_timer(e.timer);
    current_spawn_condition = current_spawn_condition + 1;

    eq.spawn_condition("greatdivide", 0, current_spawn_condition, 1);
  end
end

function Seneschal_Death(e)
  -- Event Fail
  -- Pop Giants outside of Thurgadin
  -- Depop all the mobs in Thurgadin for 2hours.
  Stop_Event();
  eq.zone_emote(13, "The forces defending the Grand Citadel of Thurgadin have failed, the Kromrif have overrun the first and oldest race.  The age of the dwarf has come to an end...");
end

function WaveMaster_Death(e)
  -- Send a signal to the ringtenmaster that one of the WaveMasters has 
  -- died; start a 5min timer before the next wave is spawned.
  eq.signal(118173, 2);
end

function Narandi_Spawn(e)
  eq.zone_emote(13, "So you have defeated my foot soldiers, now come and face me you vile, filthy dwarven rabble...");
end

function Narandi_Death(e)
  eq.zone_emote(13, 'No surprise the Age of the Dwarf continues with a Glorious victory of the Kromrif.');

  Stop_Event();
end

function event_encounter_load(e)
  eq.register_npc_event('ring_war', Event.spawn,          118173, Ten_Start);
  eq.register_npc_event('ring_war', Event.signal,         118173, Master_Signal);
  eq.register_npc_event('ring_war', Event.timer,          118173, Master_Timer);

  eq.register_npc_event('ring_war', Event.say,            118167, Zrelik_Say);
  eq.register_npc_event('ring_war', Event.death_complete, 118166, Seneschal_Death);

  -- Kromrif Captain's Death
  eq.register_npc_event('ring_war', Event.death_complete, 118130, WaveMaster_Death);
  -- Kromrif General's Death
  eq.register_npc_event('ring_war', Event.death_complete, 118120, WaveMaster_Death);
  -- Kromrif Warlord's Death
  eq.register_npc_event('ring_war', Event.death_complete, 118158, WaveMaster_Death);

  -- Narandi's Death
  eq.register_npc_event('ring_war', Event.death_complete, 118145, Narandi_Death);
  eq.register_npc_event('ring_war', Event.spawn,          118145, Narandi_Spawn);

end

function event_encounter_unload(e)
  Stop_Event();
end
