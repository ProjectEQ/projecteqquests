--#Tatsujiro_the_Serene (27110)
--Norraths Keepers Merchant

local don = require("dragons_of_norrath")

local clues_task_ids = { 4864, 4865 } -- Clues mission given by #Gordish_Frozenheart

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  local player = don.character_state.new(e.other, don.faction_id.norraths_keepers)
  if not player:has_min_faction(don.faction.Indifferent) then
    return -- todo: random low faction "talking lump of refuse" messages should be handled by source
  end

  if e.message:findi("hail") then
    local clue_id = don.finish_clues_mission(e.other, clues_task_ids) -- turning in the "Clues" mission
    if clue_id == don.clue_item_ids.scrap_of_dark_cloth then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Tatsujiro the Serene says, 'This is indeed interesting.  I've seen this sort of cloth before, though I don't think many have.  It is very old, that's for sure.  This is ancient Sebilisian cloth.  I don't know of anyone that makes cloth this way these days.  I can't imagine that this was made by any of the natives of the Broodlands.  The only place this could have come from would be a tomb or ruin in Kunark.  We'll certainly have to take a closer look at this, but my first guess is that it belongs to someone that to travel a lot and robs tombs as a hobby.  Hopefully further examination will tell us who this belonged to.  Thank you very much for bringing this to me.'")
    elseif clue_id == don.clue_item_ids.deformed_dragon_embryo then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Tatsujiro the Serene says, 'Oh my!  This is rather unpleasant, isn't it?  You say you found this in the Nest?  Well, that's interesting.  Whew, if only it didn't smell so foul!  Hang on, let me take a look at this.  I know a little about eggs, though not much about dragon eggs.  I can tell you that this egg was most certainly healthy when it was laid.  You can see that the embryo was just about fully formed before something horrible happened to it.  Whew, that smell!  If I had to guess, I'd say that this egg was no more than a few years from hatching before this happened.  And this happened recently, I can still sense the dark magic that ruined this life.  Thank you for bringing this to us.  I'll pass it on to a more skilled researcher, but first I think I'll find something waterproof to put it in, maybe that will stifle the stink.'")
    elseif clue_id == don.clue_item_ids.desiccated_drake_corpse then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Tatsujiro the Serene says, 'What is this?  Such a sad looking creature!  Look at its talons, twisted and deformed.  As deformed as this poor beast was, most of its major organs and structures are relatively normal.  I can only guess, but I'd say that whatever happened to this drake it was not a defect of birth.  It was some sort of curse or plague that caused this damage, and it did so recently.  Whatever happened down there, it had the power to warp this magnificent creature.  The pain it suffered must have been devastating.  If they think that we caused this then I can understand why they hate us so much.  Thank you for bringing this to me.'")
    elseif clue_id == don.clue_item_ids.shattered_draconic_symbol then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Tatsujiro the Serene says, 'This is a powerful item. I get shivers just touching this small part of it.  I can feel the electricity that once coursed through it.  It is obviously an artifact of the Broodlands and very old.  I can only guess what it might have looked like when whole.  Judging by the outer curvature I'd say that it might have been as large as twenty feet across, if it was indeed a disk-shaped object.  I can sense that the magic this object held was defensive in nature, some sort of warding or protective barrier.  If that's true, then it must have been huge!  Thank you so much for bringing this to us.  We will investigate this object very carefully.'")
    elseif clue_id == don.clue_item_ids.dark_dragon_scale then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Tatsujiro the Serene says, 'Welcome back!  I'm glad you made it back safely.  What is this?  This dragon scale is very unusual.  It appears to be in a state of flux, somewhere between shadow and reality. It carries a sort of static charge as well.  It appears to be a scale from the storm dragon, Yar`Lir.  That may be what it is, but it seems a little too large to be from her.  Another storm dragon perhaps?  I can't explain why it is partially in shadow, but it looks like an effect of the undead to me.  Hopefully one of our researchers can discover more.  Thank you so much for bringing this to us.'")
    else
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Tatsujiro the Serene says, 'Greetings, %s.  You look weary from so much fighting.  Get some rest and let me know if you need any of your equipment replaced.  I have an array of arms and armor assembled for the ranks of Norrath's Keepers.  Your money's no good with me, but I am collecting [radiant crystals]... if you are able to recover any. I will also accept tokens of Norrath's Keepers so we may keep track of your unsung deeds.'"):format(e.other:GetCleanName()))
    end
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
