-- #Kanetheus_Forestwalker (27085)
-- Missions

local don = require("dragons_of_norrath")

local missions = { -- live display order
  { task_id = 4929, min_faction = don.faction.Warmly },       -- Sudden Tremors [60]
  { task_id = 4930, min_faction = don.faction.Warmly },       -- Sudden Tremors [65]
  { task_id = 4931, min_faction = don.faction.Warmly },       -- Sudden Tremors [68+]
  { task_id = 5526, min_faction = don.faction.Apprehensive }, -- Animated Statue Plans [60]
  { task_id = 5527, min_faction = don.faction.Apprehensive }, -- Animated Statue Plans [65]
  { task_id = 5528, min_faction = don.faction.Apprehensive }, -- Animated Statue Plans [68+]
  { task_id = 5532, min_faction = don.faction.Amiable },      -- Storm Dragon Scales [65]
  { task_id = 5533, min_faction = don.faction.Amiable },      -- Storm Dragon Scales [68+]
  { task_id = 5534, min_faction = don.faction.Amiable },      -- Storm Dragon Scales [60]
  { task_id = 5538, min_faction = don.faction.Indifferent },  -- Diseased Pumas [60]
  -- note: on live there's a bug where this one is offered by #Boldger_Bristlebeard
  -- { task_id = 5539, min_faction = don.faction.Indifferent }, -- Diseased Pumas [65]
  { task_id = 5540, min_faction = don.faction.Indifferent },  -- Diseased Pumas [68+]
  { task_id = 5544, min_faction = don.faction.Apprehensive }, -- Tracking the Kirin [65]
  { task_id = 5545, min_faction = don.faction.Apprehensive }, -- Tracking the Kirin [68+]
  { task_id = 5546, min_faction = don.faction.Apprehensive }, -- Tracking the Kirin [60]
  { task_id = 4809, min_faction = don.faction.Amiable },      -- Best Laid Plans [60]
  { task_id = 4810, min_faction = don.faction.Amiable },      -- Best Laid Plans [65]
  { task_id = 4811, min_faction = don.faction.Amiable },      -- Best Laid Plans [68+]
  { task_id = 4815, min_faction = don.faction.Kindly },       -- Scales of Justice [60]
  { task_id = 4816, min_faction = don.faction.Kindly },       -- Scales of Justice [65]
  { task_id = 5074, min_faction = don.faction.Warmly },       -- Signal Fires [60]
  { task_id = 4817, min_faction = don.faction.Kindly },       -- Scales of Justice [68+]
  { task_id = 5075, min_faction = don.faction.Warmly },       -- Signal Fires [65]
  { task_id = 5076, min_faction = don.faction.Warmly },       -- Signal Fires [68+]
  { task_id = 4821, min_faction = don.faction.Kindly },       -- Tea for Thy Master [60]
  { task_id = 4822, min_faction = don.faction.Kindly },       -- Tea for Thy Master [65]
  { task_id = 4823, min_faction = don.faction.Kindly },       -- Tea for Thy Master [68+]
  { task_id = 4845, min_faction = don.faction.Indifferent },  -- Death Comes Swiftly [60]
  { task_id = 4846, min_faction = don.faction.Indifferent },  -- Death Comes Swiftly [65]
  { task_id = 4847, min_faction = don.faction.Indifferent },  -- Death Comes Swiftly [68+]
}

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.norraths_keepers)
    if not player:has_min_faction(don.faction.Apprehensive) then
      e.other:Message(MT.NPCQuestSay, ("Kanetheus Forestwalker says, 'Greetings, %s. I'm afraid I am not empowered to speak to you.  You are not as kindly to us as you ought to be to gain my full attention.'"):format(e.other:GetCleanName()))
    else
      local task_offers = don.get_filtered_tasks(player, missions)
      if #task_offers > 0 then
        eq.task_selector(task_offers)
      end
    end
  end
end

function event_task_accepted(e)
  if e.task_id == 4815 or e.task_id == 4816 or e.task_id == 4817 then -- Scales of Justice
    e.other:SummonItem(36215) -- item: Small sack of Koi Food
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end
