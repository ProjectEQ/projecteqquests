-- General_Lereh_Dirr (27093)
-- Dark Reign Raids

local don = require("dragons_of_norrath")

local raids = {
  { task_id = 5500, min_faction = don.faction.Amiable,     flag = don.flags.t2.said_work },     -- Fanning the Flames
  { task_id = 5502, min_faction = don.faction.HighAmiable, flag = don.flags.t3.hail_start },    -- Kessdona's Perch
  { task_id = 5504, min_faction = don.faction.HighAmiable, flag = don.flags.t3.hail_start },    -- Reflections of Silver
  { task_id = 5506, min_faction = don.faction.Kindly,      flag = don.flags.t4.yarlir_access }, -- An End to the Storms
  { task_id = 5508, min_faction = don.faction.Warmly,      flag = don.flags.t5.said_dragon },   -- In the Shadows
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
      e.other:Message(MT.Say, "General Lereh Dirr says, 'Your skill and experience suggests you are barely qualified to polish my boots! Begone from my sight, foolish weakling!  Should you ever grow up, then maybe I'll look in your direction again.'")
    else
      e.other:Message(MT.Say, "General Lereh Dirr says, 'May the Child of Hate bring a cloud of hate and darkness to reign over the lands of Norrath!'")
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
