-- #Bianca_Galbraith (27086)
-- Missions

local don = require("dragons_of_norrath")

local missions = { -- live display order
  { task_id = 4772, min_faction = don.faction.Amiable },      -- Holy Hour [60]
  { task_id = 4773, min_faction = don.faction.Amiable },      -- Holy Hour [65]
  { task_id = 4774, min_faction = don.faction.Amiable },      -- Holy Hour [68+]
  { task_id = 4775, min_faction = don.faction.Kindly },       -- Lair Unguarded [60]
  { task_id = 4776, min_faction = don.faction.Kindly },       -- Lair Unguarded [65]
  { task_id = 4777, min_faction = don.faction.Kindly },       -- Lair Unguarded [68+]
  { task_id = 4778, min_faction = don.faction.Apprehensive }, -- Simple Task [60]
  { task_id = 4779, min_faction = don.faction.Apprehensive }, -- Simple Task [65]
  { task_id = 4780, min_faction = don.faction.Apprehensive }, -- Simple Task [68+]
  { task_id = 4793, min_faction = don.faction.Amiable },      -- The Creator [60]
  { task_id = 4794, min_faction = don.faction.Amiable },      -- The Creator [65]
  { task_id = 4795, min_faction = don.faction.Amiable },      -- The Creator [68+]
  { task_id = 4796, min_faction = don.faction.Indifferent },  -- Scions of Thundercrest [60]
  { task_id = 4797, min_faction = don.faction.Indifferent },  -- Scions of Thundercrest [65]
  { task_id = 4798, min_faction = don.faction.Indifferent },  -- Scions of Thundercrest [68+]
  { task_id = 4800, min_faction = don.faction.Indifferent },  -- Splitting the Storm [60]
  { task_id = 4801, min_faction = don.faction.Indifferent },  -- Splitting the Storm [65]
  { task_id = 4802, min_faction = don.faction.Indifferent },  -- Splitting the Storm [68+]
  { task_id = 4803, min_faction = don.faction.Apprehensive }, -- Throes of Contagion [60]
  { task_id = 4804, min_faction = don.faction.Apprehensive }, -- Throes of Contagion [65]
  { task_id = 4805, min_faction = don.faction.Apprehensive }, -- Throes of Contagion [68+]
  { task_id = 4806, min_faction = don.faction.Kindly },       -- Behind Closed Doors [60]
  { task_id = 4807, min_faction = don.faction.Kindly },       -- Behind Closed Doors [65]
  { task_id = 4808, min_faction = don.faction.Kindly },       -- Behind Closed Doors [68+]
  { task_id = 5068, min_faction = don.faction.Warmly },       -- House of the Autumn Rose [60]
  { task_id = 5069, min_faction = don.faction.Warmly },       -- House of the Autumn Rose [65]
  { task_id = 5070, min_faction = don.faction.Warmly },       -- House of the Autumn Rose [68+]
}

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.norraths_keepers)
    if not player:has_min_faction(don.faction.Apprehensive) then
      e.other:Message(MT.NPCQuestSay, ("Bianca Galbraith says, 'Greetings, %s. I'm afraid I am not empowered to speak to you.  You are not as kindly to us as you ought to be to gain my full attention.'"):format(e.other:GetCleanName()))
    else
      local task_offers = don.get_filtered_tasks(player, missions)
      if #task_offers > 0 then
        eq.task_selector(task_offers)
      end
    end
  end
end

function event_task_accepted(e)
  if e.task_id == 4793 or e.task_id == 4794 or e.task_id == 4795 then -- The Creator
    e.other:SummonItem(86006) -- item: Lens of Truth
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end
