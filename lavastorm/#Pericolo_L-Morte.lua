-- #Pericolo_L`Morte (27092)
-- Missions

local don = require("dragons_of_norrath")

local missions = { -- live display order
  { task_id = 4885, min_faction = don.faction.Apprehensive }, -- Scrap Metal [65]
  { task_id = 4886, min_faction = don.faction.Apprehensive }, -- Scrap Metal [68+]
  { task_id = 4891, min_faction = don.faction.Indifferent },  -- Dragon's Egg [65]
  { task_id = 4892, min_faction = don.faction.Indifferent },  -- Dragon's Egg [68+]
  { task_id = 4897, min_faction = don.faction.Amiable },      -- Web of Lies [65]
  { task_id = 4898, min_faction = don.faction.Amiable },      -- Web of Lies [68+]
  { task_id = 4927, min_faction = don.faction.Indifferent },  -- Spider's Eye [65]
  { task_id = 4928, min_faction = don.faction.Indifferent },  -- Spider's Eye [68+]
  { task_id = 4980, min_faction = don.faction.Apprehensive }, -- Lair of the Black Wing [65]
  { task_id = 4981, min_faction = don.faction.Amiable },      -- Lost Comrades [65]
  { task_id = 4983, min_faction = don.faction.Apprehensive }, -- Lair of the Black Wing [68+]
  { task_id = 4985, min_faction = don.faction.Amiable },      -- Lost Comrades [68+]
  { task_id = 4855, min_faction = don.faction.Kindly },       -- Rivals [65]
  { task_id = 4856, min_faction = don.faction.Kindly },       -- Rivals [68+]
  { task_id = 4867, min_faction = don.faction.Kindly },       -- Clues [65]
  { task_id = 4868, min_faction = don.faction.Kindly },       -- Clues [68+]
}

local raids = {
  { task_id = 5588, min_faction = don.faction.Amiable }, -- Rampaging Monolith
  { task_id = 5589, min_faction = don.faction.Amiable }, -- Circle of Drakes
}

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.dark_reign)
    if not player:has_min_faction(don.faction.Apprehensive) then -- below apprehensive
      e.other:Message(MT.NPCQuestSay, "Pericolo L`Morte says, 'Sniveler! You dare to address me so informally? I ought to have you slain!  Begone!'")
    else -- Say channel but only sent to client
      e.other:Message(MT.Say, "Pericolo L`Morte says, 'I have some jobs that require a greater force to accomplish, 18 or so. If you think you are up for the challenge you can [see those] as well.'")
      local task_offers = don.get_filtered_tasks(player, missions)
      if #task_offers > 0 then
        eq.task_selector(task_offers)
      end
    end
  elseif e.message:findi("see those") then
    local player = don.character_state.new(e.other, don.faction_id.dark_reign)
    if not player:has_min_faction(don.faction.Apprehensive) then -- below apprehensive (gives good side message)
      e.other:Message(MT.NPCQuestSay, ("Pericolo L`Morte says, 'Greetings, %s. I'm afraid I am not empowered to speak to you.  You are not as kindly to us as you ought to be to gain my full attention.'"):format(e.other:GetCleanName()))
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
