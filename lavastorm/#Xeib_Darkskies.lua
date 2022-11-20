-- #Xeib_Darkskies (27109)
-- Dark Reign Merchant

local don = require("dragons_of_norrath")

local clues_task_ids = { 4867, 4868 } -- Clues mission given by #Pericolo_L`Morte

function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  local player = don.character_state.new(e.other, don.faction_id.dark_reign)
  if not player:has_min_faction(don.faction.Indifferent) then
    return -- todo: random low faction "talking lump of refuse" messages should be handled by source
  end

  if e.message:findi("hail") then
    local clue_id = don.finish_clues_mission(e.other, clues_task_ids) -- turning in the "Clues" mission
    if clue_id == don.clue_item_ids.scrap_of_dark_cloth then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Xeib Darkskies says, 'So you've finally returned.  Let's see what you've brought me.  A scrap of cloth, that's all!  Let me look at it, maybe you're not completely wasting my time.  Well, it's old.  I haven't seen anything like this since I did some adventuring in Kunark.  This is the sort of stuff we used to pull out of old tombs, ceremonial garb and junk like that.  Not worth anything at all these days.  Looks like it's the color of royal robes or something.  Ok, this is interesting enough, you've earned your reward.  Maybe we can find an Erudite scholar of some sort to find out who owned the robe this came from.'")
    elseif clue_id == don.clue_item_ids.deformed_dragon_embryo then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Xeib Darkskies says, 'Well, what is this?  A rotten dragon egg?  I see that the embryo is almost whole, very interesting.  This dragon couldn't have been more than a few years from being born.  It looks as though some form of darkness was laid on this egg a very short while ago.  This darkness twisted the unborn so much that it couldn't possibly have been born.  I wonder how wide-spread this darkness was.  Well done.'")
    elseif clue_id == don.clue_item_ids.desiccated_drake_corpse then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Xeib Darkskies says, 'Hah!  This is amusing!  This thing was once a perfectly healthy drake and someone managed to twist it into this form.  The power required to do this would be awesome.  I can still feel the power coming from the corpse.  This was a recent transformation.  I will need some time to study this.  There aren't too many beings on Norrath that could manage this sort of power, and I'd like to know how it was done.  Good work bringing this to me.'")
    elseif clue_id == don.clue_item_ids.shattered_draconic_symbol then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Xeib Darkskies says, 'Now this is interesting.  It looks like it is just a small part of a large emblem or seal.  It must have been very large, but then dragons tend to do things big.  It's definitely made by the dragons in the Broodlands, but it's hard to tell what it was for.  Usually a seal is used to create a barrier of some sort, either to keep things out or to lock something in.  We'll have to take a closer look at this thing.  Well done, this will be useful to us.'")
    elseif clue_id == don.clue_item_ids.dark_dragon_scale then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Xeib Darkskies says, 'Ah, you made it out alive, amazing.  What have you brought me?  A dragon scale, fascinating.  I can tell immediately that this scale is in transit from a living state to an undead state.  I am reminded of a tale I heard once of a necromancer that spent his lifetime trying to become immortal by turning his flesh into that of the undead.  The ritual used was time-consuming and difficult, but when he finally chanted the last verse and the power of the unliving was upon him, it became clear to him exactly what his new immortal life would be like.  It frightened him.  He resisted the magic that he had woven upon himself.  They say that he might still exist someplace between the world of shadow and light, fighting to die like a mortal rather than live like the undead.  A story meant to frighten young students of the necromantic arts, for sure, but I believe there is some truth to the tale.  I shall examine this scale more closely.  Your efforts for our cause are appreciated.'")
    else
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Xeib Darkskies says, 'Look at you, %s!  Your armor's barely scratched!  Have you been sitting idly by the roadside while the rest of us are doing the real fighting?  Pathetic!  I don't want to see you again until you've survived enough combat to necessitate a new set of [armor] or to give me a coveted Dark Reign token.  Now begone!  You disgust me.'"):format(e.other:GetCleanName()))
    end
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
