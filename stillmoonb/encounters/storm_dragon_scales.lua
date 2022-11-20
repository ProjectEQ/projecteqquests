local killed = 0

local function zone_death(e)
  if not e.killed:IsPet() and killed < 30 then
    killed = killed + 1
    eq.debug("killed " .. killed)
    if killed == 30 then
      eq.unique_spawn(339299, 0, 0, 1391, 6519, 743, 60) -- a_gust_of_wind
    end
  end
end

local function wind_spawn(e)
  -- live may be 105ish aggro range or some boundary area
  local x, y, z = e.self:GetX(), e.self:GetY(), e.self:GetZ()
  eq.set_proximity(x - 105, x + 105, y - 105, y + 105, z - 105, z + 105)
end

local function wind_proximity(e)
  eq.zone_emote(MT.Yellow, "The Storm Caller raises his arms as you approach, summoning swirling winds from the thin, high-altitude air.")
  eq.depop()
  eq.spawn2(339294, 0, 0, 1403.0, 6481.0, 753.0, 16.0) -- an_Ascent_storm
  eq.spawn2(339294, 0, 0, 1355.0, 6526.0, 758.0, 83.0) -- an_Ascent_storm
  eq.spawn2(339295, 0, 0, 1067.0, 6338.0, 794.0, 83.0) -- The_Storm_Caller
  eq.spawn2(339294, 0, 0, 1100.0, 6293.0, 787.0, 89.0) -- an_Ascent_storm
  eq.spawn2(339294, 0, 0, 1050.0, 6360.0, 800.0, 96.0) -- an_Ascent_storm
end

function event_encounter_load(e)
  eq.register_npc_event(Event.death_zone, 10,     zone_death) -- zone_controller
  eq.register_npc_event(Event.spawn,      339299, wind_spawn) -- a_gust_of_wind
  eq.register_npc_event(Event.enter,      339299, wind_proximity)
end
