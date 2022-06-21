-- #Gordish_Frozenheart (27087)
-- Missions

local don = require("dragons_of_norrath")

local missions = { -- live display order
  { task_id = 4883, min_faction = don.faction.Apprehensive }, -- Scrap Metal [68+]
  { task_id = 4888, min_faction = don.faction.Indifferent },  -- Dragon's Egg [65]
  { task_id = 4889, min_faction = don.faction.Indifferent },  -- Dragon's Egg [68+]
  { task_id = 4894, min_faction = don.faction.Indifferent },  -- Spider's Eye [65]
  { task_id = 4895, min_faction = don.faction.Indifferent },  -- Spider's Eye [68+]
  { task_id = 4897, min_faction = don.faction.Amiable },      -- Web of Lies [65]
  { task_id = 4898, min_faction = don.faction.Amiable },      -- Web of Lies [68+]
  { task_id = 4987, min_faction = don.faction.Apprehensive }, -- Lair of the Black Wing [65]
  { task_id = 4988, min_faction = don.faction.Amiable },      -- Lost Comrades [65]
  { task_id = 4990, min_faction = don.faction.Apprehensive }, -- Lair of the Black Wing [68+]
  { task_id = 4992, min_faction = don.faction.Amiable },      -- Lost Comrades [68+]
  { task_id = 4852, min_faction = don.faction.Kindly },       -- Rivals [65]
  { task_id = 4853, min_faction = don.faction.Kindly },       -- Rivals [68+]
  { task_id = 4864, min_faction = don.faction.Kindly },       -- Clues [65]
  { task_id = 4865, min_faction = don.faction.Kindly },       -- Clues [68+]
  { task_id = 4882, min_faction = don.faction.Apprehensive }, -- Scrap Metal [65]
}

local raids = {
  { task_id = 5586, min_faction = don.faction.Amiable }, -- Rampaging Monolith
  { task_id = 5587, min_faction = don.faction.Amiable }, -- Circle of Drakes
}

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.norraths_keepers)
    if not player:has_min_faction(don.faction.Apprehensive) then
      e.other:Message(MT.NPCQuestSay, ("Gordish Frozenheart says, 'Greetings, %s. I'm afraid I am not empowered to speak to you.  You are not as kindly to us as you ought to be to gain my full attention.'"):format(e.other:GetCleanName()))
    else -- Say channel but only sent to client
      e.other:Message(MT.Say, "Gordish Frozenheart says, 'I have some more jobs available if you have seventeen friends or so, would you like to [see those] instead?'")
      local task_offers = don.get_filtered_tasks(player, missions)
      if #task_offers > 0 then
        eq.task_selector(task_offers)
      end
    end
  elseif e.message:findi("see those") then
    local player = don.character_state.new(e.other, don.faction_id.norraths_keepers)
    if not player:has_min_faction(don.faction.Apprehensive) then
      e.other:Message(MT.NPCQuestSay, ("Gordish Frozenheart says, 'Greetings, %s. I'm afraid I am not empowered to speak to you.  You are not as kindly to us as you ought to be to gain my full attention.'"):format(e.other:GetCleanName()))
      -- todo: should also say "talking lump of refuse" low faction messages
    else
      local task_offers = don.get_filtered_tasks(player, raids)
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
