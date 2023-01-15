-- #Talontar (27091)
-- Missions

local don = require("dragons_of_norrath")

local missions = { -- live display order
  { task_id = 5510, min_faction = don.faction.Amiable },      -- Lavaspinner Hunting [55]
  { task_id = 5511, min_faction = don.faction.Amiable },      -- Lavaspinner Hunting [60]
  { task_id = 5512, min_faction = don.faction.Amiable },      -- Lavaspinner Hunting [65]
  { task_id = 5513, min_faction = don.faction.Amiable },      -- Lavaspinner Hunting [68+]
  { task_id = 5518, min_faction = don.faction.Apprehensive }, -- Grounding the Drakes [55]
  { task_id = 5004, min_faction = don.faction.Kindly },       -- Forbin's Elixir [55]
  { task_id = 5519, min_faction = don.faction.Apprehensive }, -- Grounding the Drakes [60]
  { task_id = 5005, min_faction = don.faction.Kindly },       -- Forbin's Elixir [60]
  { task_id = 5520, min_faction = don.faction.Apprehensive }, -- Grounding the Drakes [65]
  { task_id = 5006, min_faction = don.faction.Kindly },       -- Forbin's Elixir [65]
  { task_id = 5521, min_faction = don.faction.Apprehensive }, -- Grounding the Drakes [68+]
  { task_id = 5007, min_faction = don.faction.Kindly },       -- Forbin's Elixir [68+]
  { task_id = 5522, min_faction = don.faction.Amiable },      -- Infested [55]
  { task_id = 5523, min_faction = don.faction.Amiable },      -- Infested [60]
  { task_id = 5524, min_faction = don.faction.Amiable },      -- Infested [65]
  { task_id = 5525, min_faction = don.faction.Amiable },      -- Infested [68+]
  { task_id = 5020, min_faction = don.faction.Indifferent },  -- The Drake Menace [55]
  { task_id = 5021, min_faction = don.faction.Indifferent },  -- The Drake Menace [60]
  { task_id = 5022, min_faction = don.faction.Indifferent },  -- The Drake Menace [65]
  { task_id = 5023, min_faction = don.faction.Indifferent },  -- The Drake Menace [68+]
  { task_id = 5028, min_faction = don.faction.Apprehensive }, -- Lavaspinner's Locals [55]
  { task_id = 5029, min_faction = don.faction.Apprehensive }, -- Lavaspinner's Locals [60]
  { task_id = 5030, min_faction = don.faction.Apprehensive }, -- Lavaspinner's Locals [65]
  { task_id = 5031, min_faction = don.faction.Apprehensive }, -- Lavaspinner's Locals [68+]
  { task_id = 5570, min_faction = don.faction.Indifferent },  -- Diving For Lavarocks [55]
  { task_id = 5571, min_faction = don.faction.Indifferent },  -- Diving For Lavarocks [60]
  { task_id = 5572, min_faction = don.faction.Indifferent },  -- Diving For Lavarocks [65]
  { task_id = 5573, min_faction = don.faction.Indifferent },  -- Diving For Lavarocks [68+]
  { task_id = 5574, min_faction = don.faction.Kindly },       -- Storming the Goblin Temple [55]
  { task_id = 5575, min_faction = don.faction.Kindly },       -- Storming the Goblin Temple [60]
  { task_id = 5576, min_faction = don.faction.Kindly },       -- Storming the Goblin Temple [65]
  { task_id = 5577, min_faction = don.faction.Kindly },       -- Storming the Goblin Temple [68+]
  { task_id = 5596, min_faction = don.faction.Warmly },       -- A Goblin's Escort [55]
  { task_id = 5597, min_faction = don.faction.Warmly },       -- A Goblin's Escort [60]
  { task_id = 5598, min_faction = don.faction.Warmly },       -- A Goblin's Escort [65]
  { task_id = 5599, min_faction = don.faction.Warmly },       -- A Goblin's Escort [68+]
  { task_id = 5608, min_faction = don.faction.Warmly },       -- Halfling's Treasure Map [55]
  { task_id = 5609, min_faction = don.faction.Warmly },       -- Halfling's Treasure Map [60]
  { task_id = 5610, min_faction = don.faction.Warmly },       -- Halfling's Treasure Map [65]
  { task_id = 5611, min_faction = don.faction.Warmly },       -- Halfling's Treasure Map [68+]
}

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.dark_reign)
    if not player:has_min_faction(don.faction.Apprehensive) then -- below apprehensive
      e.other:Message(MT.NPCQuestSay, "Talontar says, 'Sniveler! You dare to address me so informally? I ought to have you slain!  Begone!'")
    else
      local task_offers = don.get_filtered_tasks(player, missions)
      if #task_offers > 0 then
        eq.task_selector(task_offers)
      end
    end
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end
