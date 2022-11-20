-- note this mission can be bricked if the Ancient Golem is killed before opening chest
local opened_chest = false

local function chest_death(e)
  opened_chest = true
end

local function golem_spawn(e)
  eq.set_timer("emote", 60 * 1000)
end

local function golem_timer(e)
  if opened_chest then
    eq.zone_emote(MT.Yellow, "The ground shakes violently as you hear enormous pounding from above.")
    e.self:CameraEffect(600, 0.2)
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.death_complete, 339252, chest_death) -- a_runed_chest
  eq.register_npc_event(Event.spawn,          339244, golem_spawn) -- Ancient_Golem
  eq.register_npc_event(Event.timer,          339244, golem_timer)
end
