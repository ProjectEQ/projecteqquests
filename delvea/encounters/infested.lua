local kill_count = 0
local emote_count = 0
local emote_kill_req = {
  { min = 5,  max = 10 },
  { min = 10, max = 15 },
  { min = 15, max = 25 },
  { min = 25, max = 35 },
}

-- same cosmetic emote seen in other missions occurs in this mission
local function try_emote()
  for emote_number, req in ipairs(emote_kill_req) do
    if emote_count < emote_number and kill_count >= req.min then
      local chance = 1 / (req.max - kill_count + 1) -- 100% at kill_count == max
      if math.random() < chance then
        eq.zone_emote(MT.Yellow, "The ground shakes slightly, and a loud crack and thud can be heard echoing through the tunnels.")
        emote_count = emote_count + 1
      end
    end
  end
end

local function zone_death(e)
  if not e.killed:IsPet() then
    kill_count = kill_count + 1
    try_emote()
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.death_zone, 10, zone_death) -- zone_controller (hardcoded id)
end
