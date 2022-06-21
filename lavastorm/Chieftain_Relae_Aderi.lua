-- Chieftain_Relae_Aderi (27098)
-- Norraths Keepers Recruiter

local don = require("dragons_of_norrath")

-- functions used for group mission hails and raid item turn in depending on completion order
local function finish_t2(player)
  player.client:Message(MT.Say, "Chieftain Relae Aderi says, 'Norrath's Keepers acknowledges your steadfastness and resolve in our name and Firiona herself wishes to strengthen the gift she has bestowed upon you so you may serve us with greater power.'")
  player:set_flag(don.flags.t2.complete)
end

local function finish_t3(player)
  player.client:Message(MT.Say, "Chieftain Relae Aderi says, 'Your deeds continue to astound and impress us, even Firiona Vie has taken notice of you as we carry on about your good work. She has decided to grant you greater power once again.'")
  player:set_flag(don.flags.t3.complete)
end

local function finish_t4_part1(player)
  player.client:Message(MT.Say, "Chieftain Relae Aderi says, 'You have done a great service to Norrath's Keepers.  What you have learned may have given us the edge we need over the Dark Reign. They are forever sending spies and doing all they can to undermine our efforts to bring peace and harmony in Norrath. While you have risen in our estimation since we first set eyes upon you, you would like to put your [dedication] to the test before we admit you as a Keeper.'")
end

local function finish_t4(player)
  player.client:Message(MT.Say, ("Chieftain Relae Aderi says, 'Our efforts to keep the Dark Reign at bay have been furthered by your honor and prowess, %s.  And once more Firiona wishes to grant you even greater magic and strength to carry you forward.'"):format(player.client:GetCleanName()))
  player:set_flag(don.flags.t4.complete)
end

local function finish_t5_part1(player)
  player.client:Message(MT.Say, "Chieftain Relae Aderi says, 'Gracious, that curse certainly seems to run deep. You have accomplished what very few have been able to and we'd like to reward you. As you may have already ascertained, there is a [dragon] in the Nest that we have yet to confront.  That falls to you now.'")
  -- note: on live dark reign gives the flag for vish access a step early without saying "dragon"
end

local function finish_t5(player)
  player.client:Message(MT.Say, ("Chieftain Relae Aderi says, 'Your wondrous deeds will become woven into bards' songs, %s! You are a soldier of balance and good and for that Firiona is granting the greatest divine gift that any more can bear. Use it well and continue your service of keeping evil at bay, %s.'"):format(player.client:GetCleanName(), player.client:GetCleanName()))
  player:set_flag(don.flags.t5.complete)
end

local function send_low_faction_msg(player)
  player.client:Message(MT.Say, ("Chieftain Relae Aderi says, 'Your contributions certainly do shine, %s, but to further help us is a matter of trust.  You must prove that you are ready for the higher levels of confidentiality by aiding us with more work.'"):format(player.client:GetCleanName()))
end

local function send_low_level_msg(player)
  player.client:Message(MT.Say, "Chieftain Relae Aderi says, 'You certainly appear eager and we do admire that so, but you are far too young to take on the difficult tasks I require.'")
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

  local player = don.character_state.new(e.other, don.faction_id.norraths_keepers)

  -- conditions attempt to mimic live's logic
  if e.message:findi("hail") then
    -- live checks opposing faction for AA removal here to prevent double dipping AA (unless under shroud)
    don.remove_invalid_aa(e.other, don.faction_id.dark_reign)

    -- t1 Gift of the Keepers
    if not player:has_min_faction(don.faction.Indifferent) then
      e.other:Message(MT.Say, ("Chieftain Relae Aderi says, 'Greetings, %s. I'm afraid I am not empowered to speak to you.  You are not as kindly to us as you ought to be to gain my full attention.'"):format(e.other:GetCleanName()))
    elseif player.level < 65 then
      send_low_level_msg(player)
    elseif not player:has_flag(don.flags.t1.said_help) or (not player:has_finished_t1_quests() and not player:has_flag(don.flags.t1.solo_quests_hail)) then
      e.other:Message(MT.Say, "Chieftain Relae Aderi nods his head in acknowledgement and smiles. 'Welcome to the Norrath's Keepers' enclave. We are busy protecting the way of the right and honorable now.  Our world is at a crossroads and we must endeavor to ensure we maintain order as much as we can. Should you wish to [help] us, do say so.")
    elseif not player:has_flag(don.flags.t1.solo_quests_hail) or not player:has_flag(don.flags.t1.group_mission_done) then
      e.other:Message(MT.Say, ("Chieftain Relae Aderi says, 'Welcome back, %s.  News of your good deeds is passing quickly through our ranks. I wish we could say our work is done here, but it is not. The goblins of Tirranun's Delve heard of your efforts against their kin in the Stillmoon Temple and they have vowed revenge.  One in particular, Gimblax, plans to hunt you down.  We know where he is now and if you move quickly, perhaps you can reach him first.  Speak to Dilar Nelune and he will give you further guidance.'"):format(e.other:GetCleanName()))
      player:set_flag(don.flags.t1.solo_quests_hail)
    elseif not player:has_flag(don.flags.t1.complete) or (player.level < 67 and not player:has_flag(don.flags.t2.complete)) or player:needs_aa(don.flags.t1.complete) then
      -- also t2 level check (hailing with 65 shroud falls here until t2 complete)
      e.other:Message(MT.Say, "Chieftain Relae Aderi says, 'It is time to repay you for all you have done.  Firiona Vie has chosen to share a divine gift with you that will only grow stronger if you continue to help us.  This magic to be instilled with you is a fitting reward, but you will fast lose it should you ever aid the Dark Reign -- in fact, it will disappear instantly!'")
      player:set_flag(don.flags.t1.complete)

    -- t2 Valor of the Keepers
    elseif not player:has_min_faction(don.faction.Amiable) then
      send_low_faction_msg(player)
    elseif not player:has_flag(don.flags.t2.said_work) or (not player:has_finished_t2_quests() and not player:has_flag(don.flags.t2.solo_quests_hail)) then
      e.other:Message(MT.Say, ("Chieftain Relae Aderi says, 'I am delighted to see that you got to Gimblax before he was able to get to you. It would be a great loss to us if he were to find you and carry out his plans!  You have done so well for us that we have much more for you to do if you are still willing.  If you wish to help us turn the sand goblins' anger, recover the lost map, and protect our kirin contact, please speak to Nylaen Kel`Ther and he will give you more [work].  May the light of the world shine upon you, %s!'"):format(e.other:GetCleanName()))
    elseif not player:has_flag(don.flags.t2.solo_quests_hail) or not player:has_flag(don.flags.t2.group_mission_done) or not player:has_flag(don.flags.t2.stone_fragment) then
      e.other:Message(MT.Say, "Chieftain Relae Aderi says, 'Your advancement and accomplishments are many and you have our gratitude, but I must implore you to continue to help us.  There are few as capable as you to accept the challenges that lie ahead.  Dilar Nelune has been charged with giving you the information needed to making an offering of peace and reassurance to our kirin contact.  Also, I have permitted Ekiltu Verlor to give you access to all the information you would need to bring an end to the terrible dervish, Emoush.  Bring me evidence you have overcome this challenge.'")
      player:set_flag(don.flags.t2.solo_quests_hail)
    elseif not player:has_flag(don.flags.t2.complete) or player:needs_aa(don.flags.t2.complete) then
      finish_t2(player) -- hailing completes if raid turned in before group mission

    -- t3 Embrace of the Keepers
    elseif not player:has_min_faction(don.faction.HighAmiable) then
      send_low_faction_msg(player)
    elseif player.level < 68 then
      send_low_level_msg(player)
    elseif not player:has_flag(don.flags.t3.hail_start) or (not player:has_finished_t3_quests() and not player:has_flag(don.flags.t3.solo_quests_hail)) then
      e.other:Message(MT.Say, "Chieftain Relae Aderi bows as he recognizes you. 'Your good deeds in the name of the Keepers is gaining you a great reputation and the requests for your assistance come from more and more places. I would ask you to continue with your good work and we still have several tasks you may be interested in.  Your skill and prowess have earned you entrance into the more [lauded] circles of our ranks, so what we ask now is of greater importance.'")
      player:set_flag(don.flags.t3.hail_start)
    elseif not player:has_flag(don.flags.t3.solo_quests_hail) or not player:has_flag(don.flags.t3.group_mission_done) or not player:has_flag(don.flags.t3.goblin_beads) or not player:has_flag(don.flags.t3.spider_spinners) then
      e.other:Message(MT.Say, "Chieftain Relae Aderi nods. 'We are always on the defensive and must continue to keep our minds and spirits up and charging ahead.  The tasks we present to you now are more daunting.  Having proven yourself and gained our trust brings greater challenges to you.  We ask you to learn the history of Thundercrest Isle, endure a Trial of Perseverance issued by the goblins in the Stillmoon Temple, and take on the great spider queen, Volkara.  You'll need to speak to Ekiltu Verlor for particulars and then you must return to me and give me proof you have overcome these tasks.  And do introduce yourself to Areha Burina.")
      player:set_flag(don.flags.t3.solo_quests_hail)
    elseif not player:has_flag(don.flags.t3.complete) or player:needs_aa(don.flags.t3.complete) then
      finish_t3(player) -- hailing completes if raid turned in before group mission

    -- t4 Power of the Keepers
    elseif not player:has_min_faction(don.faction.Kindly) then
      send_low_faction_msg(player)
    elseif not player:has_flag(don.flags.t4.sand_turned_in) or not player:has_flag(don.flags.t4.stone_turned_in) then
      e.other:Message(MT.Say, "Chieftain Relae Aderi says, 'Every day we learn more about the Nest and, sadly, the intentions of the Dark Reign toward the good folk of Norrath.  These are indeed troubling times, but I have no doubt that we will prevail with Firiona at our side.  Go speak to Ekiltu Verlor.  With your skills and talents, we believe you may have a good chance to overcome Shogurei, the Guardian of the Sands.  With a smaller force, you may be able to accept the challenge issued by the goblins of Thundercrest Isles.  We must attempt to beat this trial ahead of the Dark Reign so that perhaps the goblins may favor us and ease their anger toward us.  You must bring proof you have conquered both of these tasks.'")
      player:set_flag(don.flags.t4.hail_start)
    elseif not player:has_flag(don.flags.t4.yarlir_access) or not player:has_flag(don.flags.t4.yarlir_fang) then
      finish_t4_part1(player)
    elseif not player:has_flag(don.flags.t4.complete) or player:needs_aa(don.flags.t4.complete) then
      finish_t4(player)

    -- t5 Sanctity of the Keepers
    elseif not player:has_min_faction(don.faction.Warmly) then
      send_low_faction_msg(player)
    elseif not player:has_flag(don.flags.t5.group_mission_done) or not player:has_flag(don.flags.t5.diseased_wing) then
      e.other:Message(MT.Say, "Chieftain Relae Aderi says, 'As we feared, Yar`Lir was not kind to us, but it is to be expected. This fang will be treasured and protected while our researcher study it. It is not time to dawdle though. I'm sure you're already aware that the death of Yar`Lir caused a great disturbance in the Nest. Each time the storm dragon's magic is interrupted, the Nest and resting place of the eggs of the Nest's dragons become darker and we're not sure why.  In order to learn more, please talk to Dilar Nelune and Ekiltu Verlor.  They have new work for you -- to investigate a curse in the Nest and to learn about a dark drake by the name of Ju`rek.  You will need to bring me proof of your success.'")
      player:set_flag(don.flags.t5.hail_start)
    elseif not player:has_flag(don.flags.t5.said_dragon) or not player:has_flag(don.flags.t5.vish_scale) then
      finish_t5_part1(player) -- if raid item turned in before group mission, hailing completes the sub flag
    elseif not player:has_flag(don.flags.t5.complete) or player:needs_aa(don.flags.t5.complete) then
      finish_t5(player)

    -- Norrath's Keepers complete
    else
      e.other:Message(MT.Say, "Chieftain Relae Aderi says, 'Well the pieces have begun to fall into place. With all that you accomplished in bringing us artifacts and information, and the death of Yar`Lir, we have learned something disturbing.  The curse that was laid in the Nest was designed to come alive when the magic of the Nest was weakened.  It would seem someone knew that, one way or another, Norrathians would kill Yar`Lir and [break] the veil that protected the Nest underneath her.'")
      player:set_flag(don.flags.complete_hail)
    end
  elseif e.message:findi("help") then -- live doesn't check level for this
    if not player:has_min_faction(don.faction.Indifferent) then
      e.other:Message(MT.Say, ("Chieftain Relae Aderi says, 'Greetings, %s. I'm afraid I am not empowered to speak to you.  You are not as kindly to us as you ought to be to gain my full attention.'"):format(e.other:GetCleanName()))
    else
      e.other:Message(MT.Say, "Chieftain Relae Aderi says, 'Those are encouraging words and we will gladly take your offer. Please see Nylaen Kel`Ther, my trusted friend.  While his tasks may not seem glorious, they are necessary for us to gain a foothold against the Dark Reign, the followers of Lanys T`Vyl, the Child of Hate.  They have their grim eyes set on seeing the end of us all.  To begin, from the volcano, we need ingredients to create an antidote, help collecting Delvian teeth for our arrowheads, and handling goblin greed in the Stillmoon Temple.  When you satisfy these needs, then we shall speak again.'")
      player:set_flag(don.flags.t1.said_help)
    end
  elseif e.message:findi("work") and player:has_flag(don.flags.t1.solo_quests_hail) and player:has_flag(don.flags.t1.group_mission_done) then
    if has_faction_and_level(player, don.faction.Amiable, 65) then
      -- live allows triggering this after doing t1 solo quests and mission but before completion hail
      e.other:Message(MT.Say, ("Chieftain Relae Aderi says, 'This may be presumptuous and I'm not certain the kind of company you keep, but should you find the will and way, there are stories of a dragon of lava that goes by the very name of that volcano, Tirranun. We have found an entrance that would seem to lead to its lair, but none of us have found the numbers or bravery to attempt to find it.  With your associations, perhaps you would have better luck, at your leisure of course.  We must learn all we can about the dragons for we fear that the Dark Reign wish to gain control over them to use against us. In the meantime, we have bestowed upon you a reward for your assistance.  Safe travels, %s.'"):format(e.other:GetCleanName()))
      player:set_flag(don.flags.t2.said_work) -- for task offers
    end
  elseif e.message:findi("lauded") and player:has_flag(don.flags.t3.hail_start) then
    if has_faction_and_level(player, don.faction.HighAmiable, 68) then
      e.other:Message(MT.Say, "Chieftain Relae Aderi says, 'Indeed.  The people who now know and respect you are some of the closest to Firiona Vie, the Chosen of Tunare, and the leader of Norrath's Keepers. If you wish to stand alongside those who support and serve the Chosen, then you must continue to prove your worth as they all did. There are many [quests] that must be undertaken. You must speak to Nylaen Kel`Ther for those.  And you must meet Areha Burina.  She has uncovered a path to the [wyrms] of Stillmoon Temple, though our interest in them right now isn't immediate or required.'")
    end
  elseif e.message:findi("quest") and player:has_flag(don.flags.t3.hail_start) then
    if has_faction_and_level(player, don.faction.HighAmiable, 68) then
      e.other:Message(MT.Say, "Chieftain Relae Aderi says, 'You must protect the purity of the waters of Stillmoon Temple, secure the knowledge of the scrolls of the temple, and thwart the attack of the Snowfoot goblins.  Speak to Nylaen again and he will give you more information. When you are successful, return to me and I will direct you to my officers for more challenging work.'")
    end
  elseif e.message:findi("wyrm") and player:has_flag(don.flags.t3.hail_start) then
    if has_faction_and_level(player, don.faction.HighAmiable, 68) then
      e.other:Message(MT.Say, "Chieftain Relae Aderi says, 'There are two dragons that protect and serve in the Stillmoon Temple and Ascent -- Rikkukin and Kessdona.  They are mates of a breed of dragon made of precious metals. They are believed to be the first children of Veeshan on Norrath.  They are dragons of great wisdom and knowledge, but don't be fooled by their sleek beauty. Once in the past, I believe dragons of their kind had betrayed our own Firiona.  We fear they intend to betray the good of Norrath too if we lend our minds and hearts to them. You will nearly need an army of your own to overcome these dragons and we have no requirement of you to that end, but they are yours to discover.'")
    end
  elseif e.message:findi("dedication") and player:has_flag(don.flags.t4.sand_turned_in) and player:has_flag(don.flags.t4.stone_turned_in) then
    if has_faction_and_level(player, don.faction.Kindly, 68) then
      e.other:Message(MT.Say, "Chieftain Relae Aderi says, 'Lanys T`Vyl and her Dark Reign lackeys grow stronger each day and there is little time to waste. Areha Burina has some extremely challenging work for you, particularly a meeting with the dragon of [storms].'")
    end
  elseif e.message:findi("storm") and player:has_flag(don.flags.t4.sand_turned_in) and player:has_flag(don.flags.t4.stone_turned_in) then
    if has_faction_and_level(player, don.faction.Kindly, 68) then
      e.other:Message(MT.Say, "Chieftain Relae Aderi says, 'We expect that Yar`Lir, the storm dragon, is exceedingly powerful and unique. We have learned from you and the scrolls obtained from the temple, that Yar`Lir is the dragon responsible for casting a veil of magic and storms over the Nest to protect it from view and keep it hospitable for the wyrms. You must go to see her, but I would expect her to be none-to-pleased to see you there and you will likely need to [defend] yourself.  However, we would not be the keepers of these lands if we did not at least attempt to approach her civilly.'")
    end
  elseif e.message:findi("defend") and player:has_flag(don.flags.t4.sand_turned_in) and player:has_flag(don.flags.t4.stone_turned_in) then
    if has_faction_and_level(player, don.faction.Kindly, 68) then
      e.other:Message(MT.Say, "Chieftain Relae Aderi says, 'Should she attack you and you are forced to draw your weapons, know this -- killing her will disrupt the veil she casts here. This might be the opportunity that the Dark Reign looks for, but we will contend with that from here.  There is more, we believe, as we haven't found where most of the dragons eggs are kept in the Nest.  This is why we are sending you -- to learn what you can.  Also, if you can, retrieve one of Yar`Lir's fangs. Areha Burina will lead you to her.'")
      player:set_flag(don.flags.t4.yarlir_access)
    end
  elseif e.message:findi("dragon") and player:has_flag(don.flags.t5.group_mission_done) and player:has_flag(don.flags.t5.diseased_wing) then
    if has_faction_and_level(player, don.faction.Warmly, 68) then
      e.other:Message(MT.Say, "Chieftain Relae Aderi says, 'We hear that the dragon in the Nest was Yar`Lir's mate, also a dragon of storms. But as you confronted Yar`Lir and disrupted her magic, the twisting caverns of the Nest were fully bared and a sickly darkness washed over them.  It seems the curse you investigated was somehow unleashed at that moment and the dragon of the Nest was touched and darkened by it, but we don't know more than that.  He is angry, though, without question. Speak to Areha Burina.'")
      player:set_flag(don.flags.t5.said_dragon) -- note dark reign gets this a step earlier without saying "dragon"
    end
  elseif e.message:findi("break") and player:has_flag(don.flags.complete_hail) then
    if has_faction_and_level(player, don.faction.Warmly, 68) then
      e.other:Message(MT.Say, "Chieftain Relae Aderi says, 'As you know, Yar`Lir was Vishimtar's mate, another dragon of storms. It was not just Yar`Lir who held the veil of magic and storms over the Nest -- Vishimtar worked with her.  When Yar`Lir was killed and the magic veil interrupted, that's when it happened.  The [dormant curse] in the Nest was brought to life and it crept through the caverns, destroying eggs and creatures in its path, including Vishimtar.  While he was not killed, his body and magic became corrupted and he was made more powerful.'")
    end
  elseif e.message:findi("dormant") and player:has_flag(don.flags.complete_hail) then
    if has_faction_and_level(player, don.faction.Warmly, 68) then
      e.other:Message(MT.Say, "Chieftain Relae Aderi says, 'What plagues us now is the origin of the curse.  We are not sure who is responsible, but we are devoted to finding out.  You can help us no further now, but I would say you'd done enough, wouldn't you? You have certainly proved yourself and can now consider yourself one of Norrath's Keepers.'")
    end
  end

end

function event_trade(e)
  local item_lib = require("items")

  local player = don.character_state.new(e.other, don.faction_id.norraths_keepers)

  -- manually loop to support multiple turnins and live messages based on order/flag/faction
  for i=1,4 do
    local return_item = true
    local item = e.trade["item" .. i]
    if item.valid then
      local item_id = item:GetID()
      -- t2
      if item_id == 57202 then -- Glowing Stone Fragment
        return_item = don.handle_trade(player, item_id, send_low_faction_msg, function()
          e.other:Message(MT.Say, ("Chieftain Relae Aderi says, 'You have our thanks, %s.  The news of your deeds have been moving on whispers throughout Norrath's Keepers and you will be compensated.'"):format(e.other:GetCleanName()))
        end, finish_t2)
      -- t3
      elseif item_id == 57203 then -- Goblin Warlord's Beads
        return_item = don.handle_trade(player, item_id, send_low_faction_msg, function()
          e.other:Message(MT.Say, ("Chieftain Relae Aderi says, 'You've become a great contributor to our cause, %s.  There will be gifts bestowed upon you for this!'"):format(e.other:GetCleanName()))
        end, finish_t3)
      elseif item_id == 57206 then -- Lava Spider Spinners
        return_item = don.handle_trade(player, item_id, send_low_faction_msg, function()
          e.other:Message(MT.Say, "Chieftain Relae Aderi says, 'You have advanced the Norrath's Keepers beyond all of our hopes and succeeded where we feared failure.  Firiona Vie will hear of this... I shall speak with her myself.'")
        end, finish_t3)
      -- t4
      elseif item_id == 57204 then -- Meditation Stone
        return_item = don.handle_trade(player, item_id, send_low_faction_msg, function()
          e.other:Message(MT.Say, ("Chieftain Relae Aderi says, 'I will be certain your good deeds are heard by all, %s.  You will be well rewarded, I have no doubt.'"):format(e.other:GetCleanName()))
        end, finish_t4_part1)
      elseif item_id == 57207 then -- Quintessence of Sand
        return_item = don.handle_trade(player, item_id, send_low_faction_msg, function()
          e.other:Message(MT.Say, "Chieftain Relae Aderi says, 'You are indeed rising in everyone's estimation as you continue to overcome great odds Your efforts will not go unnoticed.'")
        end, finish_t4_part1)
      elseif item_id == 57200 then -- Yar`Lir's Fang
        return_item = don.handle_trade(player, item_id, send_low_faction_msg, finish_t4, nil)
      -- t5
      elseif item_id == 57205 then -- Diseased Wing Fragments
        return_item = don.handle_trade(player, item_id, send_low_faction_msg, function()
          e.other:Message(MT.Say, "Chieftain Relae Aderi says, 'A grand achievement! Norrath's Keepers will find a way to repay you, have no doubt.'")
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
