-- #Xeib_Darkskies (27109)
-- Dark Reign Merchant

local don = require("dragons_of_norrath")

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  local player = don.character_state.new(e.other, don.faction_id.dark_reign)
  if not player:has_min_faction(don.faction.Indifferent) then
    return -- todo: random low faction "talking lump of refuse" messages should be handled by source
  end

  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Xeib Darkskies says, 'Look at you, %s!  Your armor's barely scratched!  Have you been sitting idly by the roadside while the rest of us are doing the real fighting?  Pathetic!  I don't want to see you again until you've survived enough combat to necessitate a new set of [armor] or to give me a coveted Dark Reign token.  Now begone!  You disgust me.'"):format(e.other:GetCleanName()))
  elseif e.message:findi("armor") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Xeib Darkskies says, 'Yes, you fool, armor!  Dark reign has left me in charge of arms and armor requisitions.  If you need any gear replaced, I'm the one to see.  Unfortunately, any requests made by the likes of you will not meet approval from Commander Zaerr Ty`Dar.  I can make sure of that!  Hmmm...  Although if you were to bring me some [ebon crystals], I may be able to pose your request in a more... shall we say...favorable light.'")
  elseif e.message:findi("crystal") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Xeib Darkskies says, 'Yes, the ebon crystals.  Adventurers are returning with strange crystals found in the valley north of here.  No one knows the exact properties of these minerals, or where they were originally mined, but we do know that they possess an inherent energy which amplifies as the crystal shards are amassed together.  So far, our sages are baffled by the crystals' power which does not readily lend to spell casting or physical combat...  Yet still, there is an undeniable energy resonating from within each shard.  We must hurry to unlock this mystery.  Our spies report that Norrath's Keepers has already discovered another type of [mineral].'")
  elseif e.message:findi("mineral") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Xeib Darkskies says, 'Norrath's Keepers seek the radiant crystal shards.  They claim they can sense power within these minerals in the same manner that we can sense power emanating from the ebon crystals.  Our spies even report that Norrath's Keepers foolishly cast the ebon crystals aside in their single-minded search for the radiant shards.  Hmm... I wonder if the power of these minerals only resonates with certain individuals?...  In any case, we must [unlock] the secret of the crystals before our enemies manage the same feat.  Who knows what consequences loom ahead if we fail?'")
  elseif e.message:findi("unlock") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Xeib Darkskies says, 'I've taken it upon myself to collect ebon crystal shards for alchemical and arcane analysis.  If you would like help me in this effort, most of the recruiters at this camp will reward you with ebon shards for completing various missions in the dragons' valley north of here.  If you prove resourceful, you may even be able to track down some crystals yourself while you're there.  Listen, %s.  If you ever want to climb the ranks in Dark Reign, you will need my equipment to distinguish yourself.  I'd get going if I were you.  Do not fail me.'"):format(e.other:GetCleanName()))
  end
end

function event_trade(e)
  local item_lib = require("items")

  if item_lib.check_turn_in(e.trade, {item1 = 57209}) then -- Dark Reign Token
    local player = don.character_state.new(e.other, don.faction_id.dark_reign)
    if not player:has_min_faction(don.faction.Apprehensive) then
      e.other:Message(MT.NPCQuestSay, "Xeib Darkskies says, 'You don't actually think that I'm going to reward you for this, do you?  Begone, dog, before I call the guards!'")
      e.self:Say(("I have no need for this, %s. You can have it back."):format(e.other:GetCleanName()))
      e.other:SummonItem(57209) -- Dark Reign Token
    else
      e.other:Message(MT.NPCQuestSay, "Xeib Darkskies says, 'Expecting an applause? Not a chance! I will, however, put your name in my log as one who has at least made an effort on behalf of the Dark Reign.'")
      e.other:QuestReward(e.self, { faction = { don.faction_id.dark_reign, 20 } })
      don.remove_invalid_aa(e.other, don.faction_id.norraths_keepers)
    end
  end

  item_lib.return_items(e.self, e.other, e.trade)
end
