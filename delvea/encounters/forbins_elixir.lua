-- this mission has emotes on random kills like the Lavaspinner Hunting mission
-- but they don't appear to affect anything (maybe the same script is running?)
-- seen Poison Sac drop from first kill so emotes don't seem to matter for it
-- always seen 3 Poison Sacs drop in mission from initial npcs in zone (unknown on respawns)

local initialized = false
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

-- randomly assign 3 Poison Sacs to spiders in zone
local function try_add_poison_sacs()
  if initialized then
    return
  end

  local spiders = {}
  local npc_list = eq.get_entity_list():GetNPCList()
  for npc in npc_list.entries do
    if not npc:IsPet() and npc:GetName():find("lavaspinner") then
      spiders[#spiders+1] = npc
      initialized = true
    end
  end

  local added = 0
  while #spiders > 0 and added < 3 do
    local index = math.random(#spiders)
    spiders[index]:AddItem(48143, 1) -- Poison Sac
    eq.debug("Poison Sac added to npc entity " .. spiders[index]:GetID())
    table.remove(spiders, index)
    added = added + 1
  end
end

local function zone_death(e)
  if emote_count < 4 and not e.killed:IsPet() and e.killed:GetName():find("lavaspinner") then
    kill_count = kill_count + 1
    try_emote()
  end
end

local function player_enter_zone(e)
  try_add_poison_sacs() -- init on first player entry
end

function event_encounter_load(e)
  try_add_poison_sacs() -- (debugging) init on #reload quest after a #repop
  eq.register_npc_event(Event.death_zone, 10, zone_death)
  eq.register_player_event(Event.enter_zone, player_enter_zone)
end
