-- 10th Ring War
-- Great Divide
-- 118167 Zrelik the Scout
--
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
  eq.zone_emote(15, "Reset 10th Ring Stuff");
  Stop_Event();
end

function Zrelik_Say(e)
  if (e.message:findi('end')) then
    eq.zone_emote(15, "Its All over but the crying...");
    Stop_Event();
  elseif (e.message:findi('start')) then
    eq.zone_emote(15, "Start it...");
    --eq.spawn_condition("greatdivide", 0, 1, 0);
    eq.spawn_condition("greatdivide", 0, 2, 1);
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
  elseif (e.message:findi('wave 10')) then
    eq.zone_emote(15, "Wave 10");
    eq.spawn_condition("greatdivide", 0, 12, 1);
  end
end

function event_encounter_load(e)
  eq.register_npc_event('ring_war', Event.spawn, 118173, Ten_Start);
  eq.register_npc_event('ring_war', Event.say,   118167, Zrelik_Say);
end

function event_encounter_unload(e)
  eq.zone_emote(15, "unloaded event");
  Stop_Event();
end
