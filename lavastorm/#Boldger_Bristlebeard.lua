-- #Boldger_Bristlebeard (27088)
-- Missions

local don = require("dragons_of_norrath")

local missions = { -- live display order
  { task_id = 301,  min_faction = don.faction.Amiable },      -- Lavaspinner Hunting [55]
  { task_id = 302,  min_faction = don.faction.Amiable },      -- Lavaspinner Hunting [60]
  { task_id = 303,  min_faction = don.faction.Amiable },      -- Lavaspinner Hunting [65]
  { task_id = 304,  min_faction = don.faction.Amiable },      -- Lavaspinner Hunting [68+]
  { task_id = 1119, min_faction = don.faction.Apprehensive }, -- Grounding the Drakes [55]
  { task_id = 1120, min_faction = don.faction.Apprehensive }, -- Grounding the Drakes [60]
  { task_id = 1121, min_faction = don.faction.Apprehensive }, -- Grounding the Drakes [65]
  { task_id = 1122, min_faction = don.faction.Apprehensive }, -- Grounding the Drakes [68+]
  { task_id = 1130, min_faction = don.faction.Amiable },      -- Infested [55]
  { task_id = 1131, min_faction = don.faction.Amiable },      -- Infested [60]
  { task_id = 1132, min_faction = don.faction.Amiable },      -- Infested [65]
  { task_id = 1133, min_faction = don.faction.Amiable },      -- Infested [68+]
  { task_id = 5000, min_faction = don.faction.Kindly },       -- Forbin's Elixir [55]
  { task_id = 5001, min_faction = don.faction.Kindly },       -- Forbin's Elixir [60]
  { task_id = 5002, min_faction = don.faction.Kindly },       -- Forbin's Elixir [65]
  { task_id = 5003, min_faction = don.faction.Kindly },       -- Forbin's Elixir [68+]
  { task_id = 5016, min_faction = don.faction.Indifferent },  -- The Drake Menace [55]
  { task_id = 5017, min_faction = don.faction.Indifferent },  -- The Drake Menace [60]
  { task_id = 5018, min_faction = don.faction.Indifferent },  -- The Drake Menace [65]
  { task_id = 5019, min_faction = don.faction.Indifferent },  -- The Drake Menace [68+]
  { task_id = 5024, min_faction = don.faction.Apprehensive }, -- Lavaspinner's Locals [55]
  -- note: this one shows up on this npc on live but it should be on Kanetheus with other versions
  { task_id = 5539, min_faction = don.faction.Apprehensive }, -- Diseased Pumas [65]
  { task_id = 5025, min_faction = don.faction.Apprehensive }, -- Lavaspinner's Locals [60]
  { task_id = 5026, min_faction = don.faction.Apprehensive }, -- Lavaspinner's Locals [65]
  { task_id = 5027, min_faction = don.faction.Apprehensive }, -- Lavaspinner's Locals [68+]
  { task_id = 5562, min_faction = don.faction.Indifferent },  -- Diving For Lavarocks [55]
  { task_id = 5563, min_faction = don.faction.Indifferent },  -- Diving For Lavarocks [60]
  { task_id = 5564, min_faction = don.faction.Indifferent },  -- Diving For Lavarocks [65]
  { task_id = 5565, min_faction = don.faction.Indifferent },  -- Diving For Lavarocks [68+]
  { task_id = 5566, min_faction = don.faction.Kindly },       -- Storming the Goblin Temple [55]
  { task_id = 5567, min_faction = don.faction.Kindly },       -- Storming the Goblin Temple [60]
  { task_id = 5568, min_faction = don.faction.Kindly },       -- Storming the Goblin Temple [65]
  { task_id = 5569, min_faction = don.faction.Kindly },       -- Storming the Goblin Temple [68+]
  { task_id = 5600, min_faction = don.faction.Warmly },       -- A Halfling's Greed [55]
  { task_id = 5601, min_faction = don.faction.Warmly },       -- A Halfling's Greed [60]
  { task_id = 5602, min_faction = don.faction.Warmly },       -- A Halfling's Greed [65]
  { task_id = 5603, min_faction = don.faction.Warmly },       -- A Halfling's Greed [68+]
  { task_id = 5604, min_faction = don.faction.Warmly },       -- A Goblin's Escort [55]
  { task_id = 5605, min_faction = don.faction.Warmly },       -- A Goblin's Escort [60]
  { task_id = 5606, min_faction = don.faction.Warmly },       -- A Goblin's Escort [65]
  { task_id = 5607, min_faction = don.faction.Warmly },       -- A Goblin's Escort [68+]
}

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  -- unlike the indifferent+ npcs, dialogue uses NPCQuestSay channel
  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.norraths_keepers)
    if not player:has_min_faction(don.faction.Apprehensive) then
      e.other:Message(MT.NPCQuestSay, ("Boldger Bristlebeard says, 'Greetings, %s. I'm afraid I am not empowered to speak to you.  You are not as kindly to us as you ought to be to gain my full attention.'"):format(e.other:GetCleanName()))
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
