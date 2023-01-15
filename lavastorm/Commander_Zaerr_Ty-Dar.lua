-- Commander_Zaerr_Ty`Dar (27097)
-- Dark Reign Recruiter

local don = require("dragons_of_norrath")

-- functions used for group mission hails and raid item turn in depending on completion order
local function finish_t2(player)
  player.client:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'Interesting that you continue to put yourself in harms way for the Dark Reign and survive. Lanys has authorized me to improve your abilities somewhat so you can continue to risk your hide for us.  Talk to me again and if the Dark Reign considers you worthy, I will have more work.'")
  player:set_flag(don.flags.t2.complete)
end

local function finish_t3(player)
  player.client:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'Such a wonder that you're forever returning here like a rat looking for scraps. Though your reek is foul, your work has earned you more power from Lanys' great magic. There will be more work for you if you've adequately proven yourself.'")
  player:set_flag(don.flags.t3.complete)
end

local function finish_t4_part1(player)
  player.client:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'Once again you exceeded my expectations, but I still find your manner deplorable. There is something about you that leads me to think you believe you are better than the rest of us.  I suppose we shall see, shan't we? And you will likely have your chance to [prove] it.  Shogurei's essence did reveal some secrets.  He was gifted with the power of wind and storm, a magic bestowed upon it by the dragon of Thundercrest Isles. Now we know the magic the dragon holds, but we must send you to set eyes upon her.'")
end

local function finish_t4(player)
  player.client:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'Some might show you gratitude for your achievements, but I shan't. Lanys Y`Vyl has once again allowed you a greater touch of the magic of Hate. If I deem you worthy, I may have more work for you.'")
  player:set_flag(don.flags.t4.complete)
end

local function finish_t5_part1(player)
  player.client:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'From the first days when you were collecting ingredients for us, I would have never have expected you to come so far.  While you do not rival my power, you have come as close as any -- and without so annoying me that I ran you through with my blade. The moment you killed the [dragon] of the storms, the Nest below was indeed weakened and the grim dragon of the Nest was awakened and angered.'")
  player:set_flag(don.flags.t5.said_dragon) -- live gives "dragon" flag one step early on dark reign side
end

local function finish_t5(player)
  player.client:Message(MT.Say, ("Commander Zaerr Ty`Dar says, 'It has been a long journey, %s. For the last time, the Child of Hate offers you the greatest power of Hate that a mere mortal can tolerate. You have served the Dark Reign well.'"):format(player.client:GetCleanName()))
  player:set_flag(don.flags.t5.complete)
end

local function send_low_faction_msg(player)
  player.client:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'What in the...?  While a measure of arrogance can be tolerated, your stupidity cannot. You will go no further with me until you do more work for the Dark Reign.  Pay your dues, fool!'")
end

local function send_low_level_msg(player)
  player.client:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'Your skill and experience suggests you are barely qualified to polish my boots! Begone from my sight, foolish weakling!  Should you ever grow up, then maybe I'll look in your direction again.'")
end

local function has_faction_and_level(player, faction, level)
  if not player:has_min_faction(faction) then
    send_low_faction_msg(player)
    return false
  elseif player.level < level then
    send_low_level_msg(player)
    return false
  end
  return true
end

-- dialogue on live uses Say type (256) but sent to client only (similar to NPCQuestSay)
function event_say(e)
  if not e.other:GetGM() and not eq.is_dragons_of_norrath_enabled() then
    return
  end

  local player = don.character_state.new(e.other, don.faction_id.dark_reign)

  -- conditions attempt to mimic live's logic
  if e.message:findi("hail") then
    -- live checks opposing faction for AA removal here to prevent double dipping AA (unless under shroud)
    don.remove_invalid_aa(e.other, don.faction_id.norraths_keepers)

    -- t1
    if not player:has_min_faction(don.faction.Indifferent) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'Sniveler! You dare to address me so informally? I ought to have you slain!  Begone!'")
    elseif player.level < 65 then
      send_low_level_msg(player)
    elseif not player:has_flag(don.flags.t1.said_help) or (not player:has_finished_t1_quests() and not player:has_flag(don.flags.t1.solo_quests_hail)) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar sizes you up and snickers. 'How pathetic. What could you possibly do for me? You stand in the heart of the outpost of the might Dark Reign -- soldiers of Lanys T`Vyl. With her on our side, why would we need you? I assume you think you can [help].")
    elseif not player:has_flag(don.flags.t1.solo_quests_hail) or not player:has_flag(don.flags.t1.group_mission_done) then
      e.other:Message(MT.Say, ("Commander Zaerr Ty`Dar says, 'Bah! I expected someone to report that you were deceased, %s. That not the case, obviously, perhaps I can give you a more challenging task.  I have entrusted Vacax Rol`Tas with some more significant assignments. Go speak to him about the goblin's note in Tirranun's Delve and should he be satisfied with your work, perhaps I may talk again.'"):format(e.other:GetCleanName()))
      player:set_flag(don.flags.t1.solo_quests_hail)
    elseif not player:has_flag(don.flags.t1.complete) or (player.level < 67 and not player:has_flag(don.flags.t2.complete)) or player:needs_aa(don.flags.t1.complete) then
      -- also t2 level check (hailing with 65 shroud falls here until t2 complete)
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'If it will entice you to keep risking your lowly life for us, I have a rather rare reward for you -- a gift of magic from Lanys T`Vyl, the Child of Hate. It just might improve the more you help us. Do know that if you EVER turn your back on the Dark Reign and favor the Keepers, you will lose this gift in an instant.'")
      player:set_flag(don.flags.t1.complete)

    -- t2
    elseif not player:has_min_faction(don.faction.Amiable) then
      send_low_faction_msg(player)
    elseif not player:has_flag(don.flags.t2.said_work) or (not player:has_finished_t2_quests() and not player:has_flag(don.flags.t2.solo_quests_hail)) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar looks you up and down with distaste. 'You have indeed surprised us all. Not just a few eves ago your name came up while we took a meal. Oh, how we laughed. But, as you are here, perhaps you have earned some insight into the great army of the Dark Reign. Our purpose -- nay, our destiny -- is to carry on the [work] of our most-feared and revered leader, Lanys T`Vyl.")
    elseif not player:has_flag(don.flags.t2.solo_quests_hail) or not player:has_flag(don.flags.t2.group_mission_done) or not player:has_flag(don.flags.t2.stone_fragment) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'You continue to overcome the challenges that some of the grunts of the Dark Reign seem unable to. I suppose I shall continue to push the limits of your abilities to see at what point you end in a bloody mess.  I've asked Vacax to assign you with stealing drake eggs for the Dark Reign. The potion we can make with them shall be deadly, indeed. As I don't appear to be able to get rid of you, I shall direct you to Aleeth Zyrv.  The mission to investigate Emoush that he has for you is quite a bit more delicate and will require you to bring along those with skill that can be trusted. Return to me with proof when you have completed these assignments.'")
      player:set_flag(don.flags.t2.solo_quests_hail)
    elseif not player:has_flag(don.flags.t2.complete) or player:needs_aa(don.flags.t2.complete) then
      finish_t2(player) -- hailing completes t2 if raid item turned in before group mission completed

    -- t3
    elseif not player:has_min_faction(don.faction.HighAmiable) then
      send_low_faction_msg(player)
    elseif player.level < 68 then
      send_low_level_msg(player)
    elseif not player:has_flag(don.flags.t3.hail_start) or (not player:has_finished_t3_quests() and not player:has_flag(don.flags.t3.solo_quests_hail)) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar snarls as you approach. 'Still nosing around, are you? While it's somewhat appropriate you're willing to be fodder for the Dark Reign. Your desire to please is almost embarrassing -- unless you are smarter than that and have [greater motives].  I highly doubt that, however.")
      player:set_flag(don.flags.t3.hail_start)
    elseif not player:has_flag(don.flags.t3.solo_quests_hail) or not player:has_flag(don.flags.t3.group_mission_done) or not player:has_flag(don.flags.t3.goblin_beads) or not player:has_flag(don.flags.t3.spider_spinners) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar sighs. 'Why must you look at me so expectantly?  There is a long way to go before I would offer any respect. And if you're looking for thanks, your foolish gaze is in the wrong direction. Now, go speak to Vacax again and get details on a mission that might be very satisfying for you. I'd do it myself if I could -- you must attempt to collect a scroll of great power.  Also, there is an interesting test of perseverance you must overcome in the temple. You'll need to speak to Aleeth Zyrv for particulars.  And also speak to Aleeth who is pursuing Volkara in Tirranun's Delve.")
      player:set_flag(don.flags.t3.solo_quests_hail)
    elseif not player:has_flag(don.flags.t3.complete) or player:needs_aa(don.flags.t3.complete) then
      finish_t3(player) -- hailing completes if raid turned in before group mission

    -- t4
    elseif not player:has_min_faction(don.faction.Kindly) then
      send_low_faction_msg(player)
    elseif not player:has_flag(don.flags.t4.sand_turned_in) or not player:has_flag(don.flags.t4.stone_turned_in) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'The path through the temples and mountains is fraught with danger.  We have lost many who have gone on expeditions thus far. As you seem willing -- and pestering -- it's now your turn.  Go speak to Aleeth.  These assignments are not for the faint of heart and you hold the reputation of the Dark Reign in your hands -- something I will not tolerate being sullied. In the temple, you will need many allies to overcome Shogurei, the Guardian of the Sands.  With a smaller force, you may be able to accept the challenge issued by the goblins of Thundercrest Isle.  The audacity of challenging us, the army of the Child of Hate, is beyond me, but go!'")
      player:set_flag(don.flags.t4.hail_start)
    elseif not player:has_flag(don.flags.t4.yarlir_access) or not player:has_flag(don.flags.t4.yarlir_fang) then
      finish_t4_part1(player)
    elseif not player:has_flag(don.flags.t4.complete) or player:needs_aa(don.flags.t4.complete) then
      finish_t4(player)

    -- t5
    elseif not player:has_min_faction(don.faction.Warmly) then
      send_low_faction_msg(player)
    elseif not player:has_flag(don.flags.t5.group_mission_done) or not player:has_flag(don.flags.t5.diseased_wing) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'I suppose, as much as it makes my stomach turn, I can say you've earned my respect.  It is no small feat to kill a dragon, and one of Yar`Lir's caliber.  Not only that, but the death of Yar`Lir has caused a significant upheaval in the Nest and we're unclear as to why.  Figuring that out is now your job. There is some evil at work there and we need to know what it is... so perhaps we can work with it. Officer Vacax has a job for you -- to ambush a group of meddlers who are attempting to obtain information ahead of us. You will need to speak with Aleeth about a creature named Ju`rek and bring me evidence of your success.'")
      player:set_flag(don.flags.t5.hail_start)
    elseif not player:has_flag(don.flags.t5.said_dragon) or not player:has_flag(don.flags.t5.vish_scale) then
      finish_t5_part1(player) -- if raid item turned in before group mission, hailing completes the sub flag
    elseif not player:has_flag(don.flags.t5.complete) or player:needs_aa(don.flags.t5.complete) then
      finish_t5(player)

    -- Dark Reign complete
    else
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'You have done what most could not. From what we can piece together from the scrolls, the minds of the kirins obtained for us, and the death of Yar`Lir, there has been another that has brought a remarkable [darkness] over the Nest. As much as the Dark Reign would enjoy the credit, we cannot claim this great disruption.'")
      player:set_flag(don.flags.complete_hail)
    end
  elseif e.message:findi("help") then -- live doesn't check level for this
    if not player:has_min_faction(don.faction.Indifferent) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'Sniveler! You dare to address me so informally? I ought to have you slain!  Begone!'")
    else
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'Hm? I could at the very least send you on a quest that would -- with almost certainty -- see the end of you. Very well, then. Go talk to Sirrikis.  He has some menial tasks suitable for a whelp like you.  We need ingredients to create burning arrows, help collecting basilisk blood, and assistance in clearing a path for our equipment in the Stillmoon Temple.  When you satisfy these needs, then mayhap I will entertain your homely face again.'")
      player:set_flag(don.flags.t1.said_help) -- access to first 3 tasks
    end
  elseif e.message:findi("work") and player:has_flag(don.flags.t1.solo_quests_hail) and player:has_flag(don.flags.t1.group_mission_done) then
    if has_faction_and_level(player, don.faction.Amiable, 65) then
      -- live allows triggering this after doing t1 solo quests and mission but before completion hail
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'We shall be victorious in robbing the lands of those ignorant and frail races of light and good. Should you stay the path with us, perhaps you will be on the favored side of darkness as we rule Norrath! In order to even be considered for such an honor, you must continue to provide for us. I believe Sirrikis is ready to trust you with [endeavors] that are somewhat more sensitive. And you will notice that I have told Lereh Dirr that if you are foolish enough, you may attempt to slay the great lava dragon known as [Tirranun].'")
      player:set_flag(don.flags.t2.said_work) -- for task offers
    end
  elseif e.message:findi("endeavor") and player:has_flag(don.flags.t2.said_work) then
    if has_faction_and_level(player, don.faction.Amiable, 65) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'Indeed, you must aid us with gathering muddy blood from sand goblins, creating an army of stone, and gathering kirin brains.  See Officer Sirrikis for these tasks.  Should you complete all of this work, which I highly doubt, I may grant you even more challenging assignments.  Now, start marching.  Your stench is annoying me.'")
    end
  elseif e.message:findi("Tirranun") and player:has_flag(don.flags.t2.said_work) then
    if has_faction_and_level(player, don.faction.Amiable, 65) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'I don't believe you are ready, but stranger things have happened -- not withstanding your success so far.  Should you survive a meeting with this dragon of lava, we have much to learn.  His death will likely grant us enough knowledge to find a way to access the other dragons that inhabit this newly discovered land. Should we learn enough about these dragons, we may be able to exploit their kind and their knowledge for our army and serve Lanys' will in Norrath -- to see the end of the good.'")
    end
  elseif e.message:findi("greater(.*)motive") and player:has_flag(don.flags.t2.complete) then
    if has_faction_and_level(player, don.faction.HighAmiable, 68) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'Is that so? If your desire is to serve Lanys T`Vyl and this ascending army, then I can respect that to some degree. Unless you are simply willing to give us your body for our undead contingent, you have many [quests] before you get there. Should you succeed, then perhaps I won't want to sever your head from that neck of yours each time I see you. Once again, Sirrikis has the details for you.  As promised, I have given Lereh Dirr instructions to lead you to the greater [wyrms] we have uncovered the hiding place of, though our interest in them right now isn't critical.'")
      player:set_flag(don.flags.t3.hail_start) -- live adds this flag for access to t3 solo quests (same as the hail flag, but can say this phrase before that)
    end
  elseif e.message:findi("quest") and player:has_flag(don.flags.t3.hail_start) then
    if has_faction_and_level(player, don.faction.HighAmiable, 68) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'You must contaminate the waters of Stillmoon Temple, gather knowledge from the scrolls of the temple, and thwart the attack of the Snowfoot goblins.  When you are successful, return to me and I will direct you to my officers for more challenging work.'")
    end
  elseif e.message:findi("wyrm") and player:has_flag(don.flags.t3.hail_start) then
    if has_faction_and_level(player, don.faction.HighAmiable, 68) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'The dragons of the Temple and Ascent -- Rikkukin and Kessdona -- are mates of a type of dragon we've not seen.  Scales of metal have been recovered from the temple and they hold a magic that might play a vital part for us.  They are dragons of great wisdom and knowledge and besting them would be a feat that few are prepared for. But as few are foolish enough to take on the task, I thought you might be.  You will find that Sirrikis can open the way to these dragons for you.'")
    end
  elseif e.message:findi("prove") and player:has_flag(don.flags.t4.sand_turned_in) and player:has_flag(don.flags.t4.stone_turned_in) then
    if has_faction_and_level(player, don.faction.Kindly, 68) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'Lanys T`Vyl and the rest of the Dark Reign grow more powerful by the day and our work becomes ever more important to continue this glorious trend.  Lereh has some difficult employment for you, most notably a confrontation with the dragon of [storms].'")
      player:set_flag(don.flags.t4.yarlir_access)
    end
  elseif e.message:findi("storm") and player:has_flag(don.flags.t4.yarlir_access) then
    if has_faction_and_level(player, don.faction.Kindly, 68) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'Yar`Lir is perhaps the most powerful dragon known to our kind. Your work thus far has indicated to us, especially through the scrolls gathered from the temple, that Yar`Lir is the dragon responsible for casting a veil of magic and storms over the Nest to protect it from view and keep it hospitable for the wyrms. We want you to [kill] her.  Lereh knows the path to Yar`Lir.'")
    end
  elseif e.message:findi("kill") and player:has_flag(don.flags.t4.yarlir_access) then
    if has_faction_and_level(player, don.faction.Kindly, 68) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'You must kill her to disrupt her magic and weaken the area.  Soon, we shall rule the dragons and Norrath, and this is but a step on that path. This is one dragon that you must defeat before you are allowed to learn more of our knowledge of this place and to consider you a soldier of the Dark Reign.  There is more than just her to defeat as well, which I will inform you of if you defeat the dragon of storms.  You must return and give me one of her fangs.'")
    end
  elseif e.message:findi("dragon") and player:has_flag(don.flags.t5.group_mission_done) and player:has_flag(don.flags.t5.diseased_wing) then
    if has_faction_and_level(player, don.faction.Warmly, 68) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'Our rogues caught a glimpse of that dragon in the Nest and it appeared to be a dragon like Yar`Lir, but is no longer. It has been affected somehow, twisted and embroiled by shadow.  You must go find it and kill it, at all costs.  There is so much to learn and one last trophy to claim for Lanys T`Vyl, the child of Hate. Bring me Vishimtar's shadowy scale.'")
      -- dark reign side already assigned flag for access to vish raid one step earlier
    end
  elseif e.message:findi("darkness") and player:has_flag(don.flags.complete_hail) then
    if has_faction_and_level(player, don.faction.Warmly, 68) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'Yar`Lir was Vishimtar's mate, another dragon of storms. Together, the two of them used their magic to veil the Nest.  When Yar`Lir was killed and the magic veil interrupted, an incredible and delightful event took place.  A [dormant curse] in the Nest was brought to life that destroyed the eggs of the Nest and turned many of the creatures within it, including Vishimtar.  He was not killed by the curse, but corrupted and made more powerful than any dragon we have ever seen!'")
    end
  elseif e.message:findi("dormant") and player:has_flag(don.flags.complete_hail) then
    if has_faction_and_level(player, don.faction.Warmly, 68) then
      e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'What remains a mystery is the source of the curse. Someone or something was able to get into the Nest before any of us were able to... somehow.  We will not rest until we learn the origins of that curse, for the magic that created it is certainly one we ought to have on our side, wouldn't you say?  For now, your work with us is complete and we have all agreed to reward you well for all you've done in the name of Lanys T`Vyl and the outpost.  You may now safely and indisputably call yourself one of the Dark Reign.'")
    end
  end
end

function event_trade(e)
  local item_lib = require("items")

  local player = don.character_state.new(e.other, don.faction_id.dark_reign)

  -- manually loop to support multiple turnins and live messages based on order/flag/faction
  for i=1,4 do
    local return_item = true
    local item = e.trade["item" .. i]
    if item.valid then
      local item_id = item:GetID()
      -- t2
      if item_id == 57202 then -- Glowing Stone Fragment
        return_item = don.handle_trade(player, item_id, send_low_faction_msg, function()
          e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'Succeeded, hm? I'm somewhat perplexed.  In time perhaps we will compensate your deeds.'")
        end, finish_t2)
      -- t3
      elseif item_id == 57203 then -- Goblin Warlord's Beads
        return_item = don.handle_trade(player, item_id, send_low_faction_msg, function()
          e.other:Message(MT.Say, ("Commander Zaerr Ty`Dar says, 'Ha ha! Another healthy jab at the forces of good. This pleases me greatly, %s. Perhaps we'll find a reasonable way to repay you.'"):format(e.other:GetCleanName()))
        end, finish_t3)
      elseif item_id == 57206 then -- Lava Spider Spinners
        return_item = don.handle_trade(player, item_id, send_low_faction_msg, function()
          e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'And so Norrath's Keepers loses to our greatness once again. You've given me and Lanys plenty to mull over and snicker about. Your service to the Dark Reign has been painful, but satisfying to me. Continue to serve and we will reward you well.'")
        end, finish_t3)
      -- t4
      elseif item_id == 57204 then -- Meditation Stone
        return_item = don.handle_trade(player, item_id, send_low_faction_msg, function()
          e.other:Message(MT.Say, "Commander Zaerr Ty`Dar sneers slightly.  'Humph, so you were victorious. That's barely notable, but probably worth a reward at some juncture.'")
        end, finish_t4_part1)
      elseif item_id == 57207 then -- Quintessence of Sand
        return_item = don.handle_trade(player, item_id, send_low_faction_msg, function()
          e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'What of it? If you expect a dark elf of my stature to kowtow to you, your mind is seething with delusions. I suppose someone may ask me to reward you should you continue to prove yourself.'")
        end, finish_t4_part1)
      elseif item_id == 57200 then -- Yar`Lir's Fang
        return_item = don.handle_trade(player, item_id, send_low_faction_msg, finish_t4, nil)
      -- t5
      elseif item_id == 57205 then -- Diseased Wing Fragments
        return_item = don.handle_trade(player, item_id, send_low_faction_msg, function()
          e.other:Message(MT.Say, "Commander Zaerr Ty`Dar says, 'If I had no proof of your past accomplishments, I'd suggest you cheated your way through this. That said, compensation will be coming to you should you remain loyal to the Dark Reign.'")
        end, finish_t5_part1)
      elseif item_id == 57201 then -- Shadowscale of Vishimtar
        return_item = don.handle_trade(player, item_id, send_low_faction_msg, finish_t5, nil)
      end

      if not return_item then -- item turned in succesfully, remove from return list
        e.trade["item" .. i] = ItemInst()
        e.other:QuestReward(e.self)
      end
    end
  end

  item_lib.return_items(e.self, e.other, e.trade)
end
