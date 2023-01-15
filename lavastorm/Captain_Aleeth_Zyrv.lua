-- Captain_Aleeth_Zyrv (27094)
-- Dark Reign Events

local don = require("dragons_of_norrath")

local raids = { -- live display order
  { task_id = 4953, min_faction = don.faction.Kindly,      flag = don.flags.t4.hail_start },       -- Guardian of the Sands
  { task_id = 5054, min_faction = don.faction.HighAmiable, flag = don.flags.t3.solo_quests_hail }, -- Trial of Perseverance
  { task_id = 5579, min_faction = don.faction.Warmly,      flag = don.flags.t5.hail_start },       -- The Curse of Ju`rek
  { task_id = 5581, min_faction = don.faction.Amiable,     flag = don.flags.t1.solo_quests_hail }, -- Calling Emoush
  { task_id = 5583, min_faction = don.faction.HighAmiable, flag = don.flags.t3.solo_quests_hail }, -- Volkara's Bite
  { task_id = 5585, min_faction = don.faction.Kindly,      flag = don.flags.t4.hail_start },       -- Goblin Dojo
}

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  if e.message:findi("hail") then
    local player = don.character_state.new(e.other, don.faction_id.dark_reign)
    if not player:has_min_faction(don.faction.Indifferent) then
      e.other:Message(MT.Say, "General Lereh Dirr says, 'Sniveler! You dare to address me so informally? I ought to have you slain!  Begone!'")
    elseif e.other:GetLevel() < 65 then
      e.other:Message(MT.Say, "Captain Aleeth Zyrv says, 'Your skill and experience suggests you are barely qualified to polish my boots! Begone from my sight, foolish weakling!  Should you ever grow up, then maybe I'll look in your direction again.'")
    else
      e.other:Message(MT.Say, ("Captain Aleeth Zyrv says, 'You must search the blackest recesses of your heart to serve us well, %s. Our endeavors are not for the frail.'"):format(e.other:GetCleanName()))
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
