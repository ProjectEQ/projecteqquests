-- Captain_Areha_Burina (27102)
-- Norrath's Keepers Raids

local don = require("dragons_of_norrath")

local raids = { -- live display order
  { task_id = 5501, min_faction = don.faction.Amiable,     flag = don.flags.t2.said_work },     -- Fanning the Flames
  { task_id = 5503, min_faction = don.faction.HighAmiable, flag = don.flags.t3.hail_start },    -- Kessdona's Perch
  { task_id = 5505, min_faction = don.faction.HighAmiable, flag = don.flags.t3.hail_start },    -- Reflections of Silver
  { task_id = 5507, min_faction = don.faction.Kindly,      flag = don.flags.t4.yarlir_access }, -- An End to the Storms
  { task_id = 5509, min_faction = don.faction.Warmly,      flag = don.flags.t5.said_dragon },   -- In the Shadows
}

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.norraths_keepers)
    if not player:has_min_faction(don.faction.Indifferent) then
      e.other:Message(MT.Say, ("Captain Areha Burina says, 'Greetings, %s. I'm afraid I am not empowered to speak to you.  You are not as kindly to us as you ought to be to gain my full attention.'"):format(e.other:GetCleanName()))
    elseif e.other:GetLevel() < 65 then
      e.other:Message(MT.Say, "Captain Areha Burina says, 'You certainly appear eager and we do admire that so, but you are far too young to take on the difficult tasks I require.'")
    else
      e.other:Message(MT.Say, "Captain Areha Burina bows. 'I see a good heart in you and a measure of bravery. Serve Firiona Vie and Norrath's Keepers well!'")
      local task_offers = don.get_filtered_tasks(player, raids)
      if #task_offers == 0 then -- eqstr id 8940 (source-based custom selector filters not implemented)
        e.other:Message(MT.Red, "Your group does not meet the requirements for any available shared tasks.")
      else
        eq.task_selector(task_offers)
      end
    end
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end
