local egg_count = 0
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

-- Add 'Drake Fang' drops which is the mission item in 'Grounding the Drakes'
-- it drops in this mission at a higher rate likely due to a live bug
local function zone_spawn(e)
  local max_drake_fang_stack = 12 -- max stack size seen in this mission

  if not e.other:IsPet() and e.other:GetName():find("_Delve_") then
    local add_count = 0
    for i=1,max_drake_fang_stack do
      if math.random() <= 0.80 then -- 80%
        add_count = add_count + 1
      else
        break
      end
    end

    if add_count > 0 then
      e.other:AddItem(48144, add_count) -- Drake Fang
    end
  end
end

local function zone_death(e)
  if e.killed:IsPet() then
    return
  end

  kill_count = kill_count + 1
  try_emote()

  if e.killed:GetName():find("a_drake_egg") then
    egg_count = egg_count + 1
    eq.debug(("egg count: %d"):format(egg_count))
    if egg_count == 15 then
      eq.zone_emote(MT.Yellow, "As the final egg shatters you can feel a gust of wind hit you as the Drake Matriarch assaults you.")
      eq.unique_spawn(341149, 0, 0, e.killed:GetX(), e.killed:GetY(), e.killed:GetZ(), e.killed:GetHeading()) -- #Drake_Matriarch
    end
  end

  -- live does this emote on any npc death while a multiple of 4 eggs have been destroyed, not just egg deaths
  if egg_count > 0 and egg_count < 15 and egg_count % 4 == 0 then
    eq.zone_emote(MT.Yellow, "As you destroy the egg, you can hear screeches behind you with the flapping of wings nearby.")
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.spawn_zone, 10, zone_spawn) -- zone_controller
  eq.register_npc_event(Event.death_zone, 10, zone_death)
end
