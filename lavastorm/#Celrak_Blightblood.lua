-- #Celrak_Blightblood (27089)
-- Missions

local don = require("dragons_of_norrath")

local missions = { -- live display order
  { task_id = 4932, min_faction = don.faction.Warmly },       -- Sudden Tremors [60]
  { task_id = 4933, min_faction = don.faction.Warmly },       -- Sudden Tremors [65]
  { task_id = 4934, min_faction = don.faction.Warmly },       -- Sudden Tremors [68+]
  { task_id = 5529, min_faction = don.faction.Apprehensive }, -- Animated Statue Plans [60]
  { task_id = 5530, min_faction = don.faction.Apprehensive }, -- Animated Statue Plans [65]
  { task_id = 5531, min_faction = don.faction.Apprehensive }, -- Animated Statue Plans [68+]
  { task_id = 5535, min_faction = don.faction.Amiable },      -- Storm Dragon Scales [65]
  { task_id = 5536, min_faction = don.faction.Amiable },      -- Storm Dragon Scales [68+]
  { task_id = 5537, min_faction = don.faction.Amiable },      -- Storm Dragon Scales [60]
  { task_id = 5541, min_faction = don.faction.Indifferent },  -- Diseased Pumas [60]
  { task_id = 5542, min_faction = don.faction.Indifferent },  -- Diseased Pumas [65]
  { task_id = 5543, min_faction = don.faction.Indifferent },  -- Diseased Pumas [68+]
  { task_id = 5547, min_faction = don.faction.Apprehensive }, -- Tracking the Kirin [65]
  { task_id = 5548, min_faction = don.faction.Apprehensive }, -- Tracking the Kirin [68+]
  { task_id = 5549, min_faction = don.faction.Apprehensive }, -- Tracking the Kirin [60]
  { task_id = 4812, min_faction = don.faction.Amiable },      -- Best Laid Plans [60]
  { task_id = 4813, min_faction = don.faction.Amiable },      -- Best Laid Plans [65]
  { task_id = 4814, min_faction = don.faction.Amiable },      -- Best Laid Plans [68+]
  { task_id = 4818, min_faction = don.faction.Kindly },       -- Scales of Justice [60]
  { task_id = 4819, min_faction = don.faction.Kindly },       -- Scales of Justice [65]
  { task_id = 5077, min_faction = don.faction.Warmly },       -- Signal Fires [60]
  { task_id = 4820, min_faction = don.faction.Kindly },       -- Scales of Justice [68+]
  { task_id = 5078, min_faction = don.faction.Warmly },       -- Signal Fires [65]
  { task_id = 5079, min_faction = don.faction.Warmly },       -- Signal Fires [68+]
  { task_id = 4824, min_faction = don.faction.Kindly },       -- Tea for Thy Master [60]
  { task_id = 4825, min_faction = don.faction.Kindly },       -- Tea for Thy Master [65]
  { task_id = 4826, min_faction = don.faction.Kindly },       -- Tea for Thy Master [68+]
  { task_id = 4848, min_faction = don.faction.Indifferent },  -- Death Comes Swiftly [60]
  { task_id = 4849, min_faction = don.faction.Indifferent },  -- Death Comes Swiftly [65]
  { task_id = 4850, min_faction = don.faction.Indifferent },  -- Death Comes Swiftly [68+]
}

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.dark_reign)
    if not player:has_min_faction(don.faction.Apprehensive) then -- below apprehensive
      e.other:Message(MT.NPCQuestSay, "Celrak Blightblood says, 'Sniveler! You dare to address me so informally? I ought to have you slain!  Begone!'")
    else
      local task_offers = don.get_filtered_tasks(player, missions)
      if #task_offers > 0 then
        eq.task_selector(task_offers)
      end
    end
  end
end

function event_task_accepted(e)
  if e.task_id == 4818 or e.task_id == 4819 or e.task_id == 4820 then -- Scales of Justice
    e.other:SummonItem(36215) -- item: Small sack of Koi Food
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end
