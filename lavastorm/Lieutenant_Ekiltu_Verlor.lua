-- Lieutenant_Ekiltu_Verlor (27101)
-- Norrath's Keepers Events

local don = require("dragons_of_norrath")

local raids = { -- live display order
  { task_id = 4952, min_faction = don.faction.Kindly,      flag = don.flags.t4.hail_start },       -- Guardian of the Sands
  { task_id = 5053, min_faction = don.faction.HighAmiable, flag = don.flags.t3.solo_quests_hail }, -- Trial of Perseverance
  { task_id = 5578, min_faction = don.faction.Warmly,      flag = don.flags.t5.hail_start },       -- The Curse of Ju`rek
  { task_id = 5580, min_faction = don.faction.Amiable,     flag = don.flags.t1.solo_quests_hail }, -- Calling Emoush
  { task_id = 5582, min_faction = don.faction.HighAmiable, flag = don.flags.t3.solo_quests_hail }, -- Volkara's Bite
  { task_id = 5584, min_faction = don.faction.Kindly,      flag = don.flags.t4.hail_start },       -- Goblin Dojo
}

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.norraths_keepers)
    if not player:has_min_faction(don.faction.Indifferent) then
      e.other:Message(MT.Say, ("Lieutenant Ekiltu Verlor says, 'Greetings, %s. I'm afraid I am not empowered to speak to you.  You are not as kindly to us as you ought to be to gain my full attention.'"):format(e.other:GetCleanName()))
    elseif e.other:GetLevel() < 65 then
      e.other:Message(MT.Say, "Lieutenant Ekiltu Verlor says, 'You certainly appear eager and we do admire that so, but you are far too young to take on the difficult tasks I require.'") 
    else
      e.other:Message(MT.Say, "Lieutenant Ekiltu Verlor says, 'Those faithful to the way of Norrath's Keepers may take on the greatest challenges and prove their worth to Firiona Vie.'")
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
