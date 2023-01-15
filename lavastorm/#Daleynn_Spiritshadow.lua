-- #Daleynn_Spiritshadow (27090)
-- Missions

local don = require("dragons_of_norrath")

local missions = { -- live display order
  { task_id = 4964, min_faction = don.faction.Amiable },      -- The Creator [60]
  { task_id = 4965, min_faction = don.faction.Amiable },      -- The Creator [65]
  { task_id = 4966, min_faction = don.faction.Amiable },      -- The Creator [68+]
  { task_id = 4967, min_faction = don.faction.Indifferent },  -- Scions of Thundercrest [60]
  { task_id = 4968, min_faction = don.faction.Indifferent },  -- Scions of Thundercrest [65]
  { task_id = 4969, min_faction = don.faction.Indifferent },  -- Scions of Thundercrest [68+]
  { task_id = 4971, min_faction = don.faction.Indifferent },  -- Splitting the Storm [60]
  { task_id = 4972, min_faction = don.faction.Indifferent },  -- Splitting the Storm [65]
  { task_id = 4973, min_faction = don.faction.Indifferent },  -- Splitting the Storm [68+]
  { task_id = 4974, min_faction = don.faction.Apprehensive }, -- Throes of Contagion [60]
  { task_id = 4975, min_faction = don.faction.Apprehensive }, -- Throes of Contagion [65]
  { task_id = 4976, min_faction = don.faction.Apprehensive }, -- Throes of Contagion [68+]
  { task_id = 4977, min_faction = don.faction.Kindly },       -- Behind Closed Doors [60]
  { task_id = 4978, min_faction = don.faction.Kindly },       -- Behind Closed Doors [65]
  { task_id = 4979, min_faction = don.faction.Kindly },       -- Behind Closed Doors [68+]
  { task_id = 5035, min_faction = don.faction.Amiable },      -- Holy Hour [60]
  { task_id = 5036, min_faction = don.faction.Amiable },      -- Holy Hour [65]
  { task_id = 5037, min_faction = don.faction.Amiable },      -- Holy Hour [68+]
  { task_id = 5038, min_faction = don.faction.Kindly },       -- Lair Unguarded [60]
  { task_id = 5039, min_faction = don.faction.Kindly },       -- Lair Unguarded [65]
  { task_id = 5040, min_faction = don.faction.Kindly },       -- Lair Unguarded [68+]
  { task_id = 5041, min_faction = don.faction.Apprehensive }, -- Simple Task [60]
  { task_id = 5042, min_faction = don.faction.Apprehensive }, -- Simple Task [65]
  { task_id = 5043, min_faction = don.faction.Apprehensive }, -- Simple Task [68+]
  { task_id = 5590, min_faction = don.faction.Warmly },       -- Plunder the Hoard [60]
  { task_id = 5591, min_faction = don.faction.Warmly },       -- Plunder the Hoard [65]
  { task_id = 5592, min_faction = don.faction.Warmly },       -- Plunder the Hoard [68+]
}

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.dark_reign)
    if not player:has_min_faction(don.faction.Apprehensive) then -- below apprehensive
      e.other:Message(MT.NPCQuestSay, "Daleynn Spiritshadow says, 'Sniveler! You dare to address me so informally? I ought to have you slain!  Begone!'")
    else
      local task_offers = don.get_filtered_tasks(player, missions)
      if #task_offers > 0 then
        eq.task_selector(task_offers)
      end
    end
  end
end

function event_task_accepted(e)
  if e.task_id == 4964 or e.task_id == 4965 or e.task_id == 4966 then -- The Creator
    e.other:SummonItem(86006) -- item: Lens of Truth
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end
