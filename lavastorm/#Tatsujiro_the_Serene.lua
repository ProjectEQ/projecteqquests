--#Tatsujiro_the_Serene (27110)
--Norraths Keepers Merchant

local don = require("dragons_of_norrath")

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  local player = don.character_state.new(e.other, don.faction_id.norraths_keepers)
  if not player:has_min_faction(don.faction.Indifferent) then
    return -- todo: random low faction "talking lump of refuse" messages should be handled by source
  end

  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Tatsujiro the Serene says, 'Greetings, %s.  You look weary from so much fighting.  Get some rest and let me know if you need any of your equipment replaced.  I have an array of arms and armor assembled for the ranks of Norrath's Keepers.  Your money's no good with me, but I am collecting [radiant crystals]... if you are able to recover any. I will also accept tokens of Norrath's Keepers so we may keep track of your unsung deeds.'"):format(e.other:GetCleanName()))
  elseif e.message:findi("radiant crystals") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Tatsujiro the Serene says, 'Adventurers are returning with strange crystals found in the valley north of here.  No one knows the exact properties of these minerals, or where they were originally mined, but we do know that they possess an inherent energy which amplifies as the crystal shards are amassed together.  So far, our sages are baffled by the crystals' power which does not readily lend to spell casting or physical combat...  Yet still, there is an undeniable energy resonating from within each shard.  We must hurry to unlock this secret.  Our spies report that Dark Reign has already discovered another type of [mineral].'")
  elseif e.message:findi("mineral") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Tatsujiro the Serene says, 'Dark Reign seeks the ebon crystal shards.  They claim they can sense power within these minerals in the same manner that we can sense power emanating from the radiant crystals.  Our spies even report that Dark Reign foolishly casts radiant crystals aside in their single-minded search for the ebon shards.  Hmm... I wonder if the power of these minerals only resonates with certain individuals?...  In any case, we must [unlock] the secret of the crystals before our enemies manage the same feat.  Who knows what consequences loom ahead if we fail?'")
  elseif e.message:findi("unlock") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Tatsujiro the Serene says, 'I've taken it upon myself to collect radiant crystal shards for alchemical and arcane analysis.  If you would like help me in this effort, most of the recruiters at this camp will reward you with radiant shards for completing various missions in the dragons' valley north of here.  You may even be able to track down some crystal yourself while you're there?  Be careful, %s.  Danger lurks ahead and the way will not be easy.'"):format(e.other:GetCleanName()))
  end
end

function event_trade(e)
  local item_lib = require("items")

  if item_lib.check_turn_in(e.trade, {item1 = 57208}) then -- Norrath's Keepers Token
    local player = don.character_state.new(e.other, don.faction_id.norraths_keepers)
    if not player:has_min_faction(don.faction.Apprehensive) then
      e.other:Message(MT.NPCQuestSay, ("Tatsujiro the Serene says, 'I'm sorry, %s, but you are not in good standing with Norrath's Keepers so I cannot accept this token from you.'"):format(e.other:GetCleanName()))
      e.self:Say(("I have no need for this, %s. You can have it back."):format(e.other:GetCleanName()))
      e.other:SummonItem(57208) -- Norrath's Keepers Token
    else
      e.other:Message(MT.NPCQuestSay, ("Tatsujiro the Serene says, 'Much appreciated, %s.  We do so like to keep track of the work Norrathians do in our name.'"):format(e.other:GetCleanName()))
      e.other:QuestReward(e.self, { faction = { don.faction_id.norraths_keepers, 20 } })
      don.remove_invalid_aa(e.other, don.faction_id.dark_reign)
    end
  end

  item_lib.return_items(e.self, e.other, e.trade)
end
