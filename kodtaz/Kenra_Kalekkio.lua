-- Ikkinz Group 3 Expedition
-- npc id: 293118
-- items: 60154
local expedition_name = "Ikkinz, Chambers of the Tri-Fates"
local dz_version = instance_version.ikkinz_chambers_of_the_tri_fates

local expedition_info = {
  expedition = { name=expedition_name, min_players=1, max_players=6 },
  instance   = { zone="ikkinz", version=dz_version, duration=eq.seconds("3h") },
  compass    = { zone="kodtaz", x=-1054.0, y=-1138.0, z=-417 },
  safereturn = { zone="kodtaz", x=-1018.0, y=-1131.0, z=-418.0, h=0.0 },
  zonein     = { x=-157.0, y=23.0, z=-2.0, h=256.0 }
}

function event_say(e)
  local qglobals = eq.get_qglobals(e.other)

  local is_gm = (e.other:Admin() > 80 and e.other:GetGM())
  local has_kevren_flag = (is_gm or (tonumber(qglobals.ikky) and tonumber(qglobals.ikky) >= 1))
  local finished_first_trial = (is_gm or (tonumber(qglobals.ikky) and tonumber(qglobals.ikky) >= 2))
  local finished_second_trial = (is_gm or (tonumber(qglobals.ikky) and tonumber(qglobals.ikky) >= 3))
  local finished_third_trial = (tonumber(qglobals.ikky) and tonumber(qglobals.ikky) >= 4)

  local preflag_key = string.format("%s-ikkinz_group3_kenra", e.other:CharacterID())

  if e.message:findi("hail") then
    if not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, ("Kenra Kalekkio says, 'It would be best if you kept out of sight, %s. You never know when one of those fearsome invaders might wander past looking for a fight. You look like you're here with a purpose, but I can't quite figure out what. Why don't you go see Kevren? He should be more than happy to speak to another adventurer.'"):format(e.other:GetCleanName()))
    elseif not finished_first_trial then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'Oh dear, you startled me! I hate to be rude, but you must understand that I'm on very important business here and I don't have time to chat with you now. You still need to find Gazak Klelkek and complete the first trial anyway, so why don't you get on your way? Good luck!'")
    elseif not finished_second_trial then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'Oh dear, you startled me! I hate to be rude, but you must understand that I'm on very important business here and I don't have time to chat with you now. You still need to find Maroley Nazuey and complete the second trial anyway, so why don't you get on your way? Good luck!'")
    elseif not finished_third_trial then
      e.other:Message(MT.NPCQuestSay, ("Kenra Kalekkio says, 'I have been expecting you, %s. You proven your worth thus far by completing the first two trials and for that I applaud you. You are not through with your testing though. You have a [" .. eq.say_link("final test") .. "] to complete here at the Temple of the Tri-Fates before you will be considered ready for further work.'"):format(e.other:GetCleanName()))
    else
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'Though you have already completed the third trial, we will allow you to continue to sharpen your abilities in the temple. I must remind you that though these trials are for your benefit, we cannot control what goes on inside. If you still want to [" .. eq.say_link("prove yourself") .. "], tell me, and I will make preparations for you to enter the temple.'")
    end
  elseif e.message:findi("final(.*)test") then
    if not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'Impossible. You have not begun making preparations to start your trials, and you think you can attempt a final test? You're either incredibly brave or incredibly simpleminded. Go speak with Kevren Nalavat to the north about the trials and we shall see which is correct.'")
    elseif not finished_first_trial then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'You can't possibly be ready for your final test, you haven't even finished the first trial yet. Go back and speak with Gazak Klelkek at the Temple of Singular Might for information on the first trial.'")
    elseif not finished_second_trial then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'I don't believe you're ready for your final test yet. You haven't completed your second test at the Temple of Twin Struggles yet. Go back to Maroley Nazuey and speak with her about completing the second trial.'")
    else
      e.other:Message(MT.NPCQuestSay, ("Kenra Kalekkio says, 'Very well. Time is critical, %s. Your final test takes you within the Temple of the Tri-Fates. We call it this because of the three creatures you will encounter once inside. The [" .. eq.say_link("three beasts") .. "] are hunters that have deadly accuracy with a bow and attack together to make a dangerous combination.'"):format(e.other:GetCleanName()))
    end
  elseif e.message:findi("three(.*)beast") then
    if not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'I seriously doubt you'd have anything to do with three beasts. Of course, I wouldn't know for sure, because you haven't even made preparations to start any trials at all. You should find Kevren Nalavat to the north and speak to him about the trials.'")
    elseif not finished_first_trial then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'Three beasts? You haven't even slain one beast, let alone three. Go find Gazak Klelkek at the Temple of Singular Might and complete the first trial before you thinking about doing anything else.'")
    elseif not finished_second_trial then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'Slow down for a moment. You're not yet ready to be talking to me about any kind of beast. You still need to finish the second trial and that means that you need to go find Maroley Nazuey at the Temple of Twin Struggles.'")
    else
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'The three hunters inside the temple are called the Tri-Fates. They are named thusly because of their ability to control your fate on a whim. Their victims' usual fate is that of death, though I believe the Wayfarers Brotherhood has recruits that can stand up to them. Perhaps you are that person? Perhaps you have the desire to [" .. eq.say_link("prove yourself") .. "] worthy, venture into the temple, and slay the beasts?'")
    end
  elseif e.message:findi("prove") then
    if not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'You have to have a reason to prove yourself first. Go find Kevren Nalavat to the north and ask him about the trials. I have no doubt that he'll have information for you that will allow you to prove yourself more than once.'")
    elseif not finished_first_trial then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'I have no doubt that you can prove yourself, but the fact remains that you haven't even completed the first trial. It would be best for you to find Gazak Klelkek at the Temple of Singular Might and talk to him about completing the first trial before doing anything else.'")
    elseif not finished_second_trial then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'I'm sure you're more than willing to prove that you're capable of doing more than you've been asked to, but you're not to that point yet. You need to finish the second trial first and that means finding Maroley Nazuey at the Temple of Twin Struggles before anything else.'")
    else
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'Good to hear, but before you go there is more you must know. These hunters are guarding some relics that are giving them extremely high accuracy with their weapons. If they are allowed to possess these relics any longer, they may become an unstoppable force. You must [" .. eq.say_link("recover the relics") .. "] so the Wayfarers Brotherhood can examine them.'")
    end
  elseif e.message:findi("recover(.*)relic") then
    if not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'You won't be recovering any relics any time soon. You need to find Kevren Nalavat to the north and speak to him before you do anything else. He's got the important information you need to start collecting relics and artifacts. Good luck, I have a feeling you'll need it.'")
    elseif not finished_first_trial then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'I'm sure you think you're ready to recover all kinds of relics, but you haven't even finished the first trial. If you speak with Gazak Klelkek at the Temple of Singular Might, I have no doubt that he'll have something just as exciting for you to do in the first trial.'")
    elseif not finished_second_trial then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'You can't recover any relics from this temple yet. You have to complete the second trial first! Go find Maroley Nazuey at the Temple of Twin Struggles for more information on the second trial.'")
    else
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'This is your final trial and will prove, once and for all, if you are capable of taking on the more serious issues concerning the Muramites. You must fight through the temple and enter an entrance to the inner chambers of the Temple of the Tri-Fates. Once inside, kill the Tri-Fates and return the relics. When you are [" .. eq.say_link("ready to begin") .. "] and have a group with you, return to me, and I shall send you on your way.'")
      eq.set_data(preflag_key, "1")
    end
  elseif e.message:findi("ready(.*)begin") then
    if not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'You're not ready to begin anything, yet. You haven't even made your preparations to begin the trials, so talking to me is a waste of time. Go find Kevren Nalavat to the north and ask him about the trials. That will give you something to get ready for.'")
    elseif not finished_first_trial then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'I don't think you're ready to begin anything except for the first trial. That's all you can do for the time being, but you need to find Gazak Klelkek at the Temple of Singular Might so he can guide you through it.'")
    elseif not finished_second_trial then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'What is it that you believe you're ready to begin? I hope you don't believe it has anything to do with me yet. You still need to finish the second trial and, to do so, you need to find Maroley Nazuey at the Temple of Twin Struggles and have her give you that information.'")
    elseif not is_gm and eq.get_data(preflag_key) == "" then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'You say you think you're ready to begin something? Does that have anything to do with your [" .. eq.say_link("final test") .. "]?'")
    elseif not is_gm and e.other:GetGroupMemberCount() < 2 then -- live probably missing speak_mode say flag here
      e.other:Message(MT.NPCQuestSay, "I'm sorry, but you don't have enough comrades with you to venture into this dangerous area. Come back when you have at least two friends to join you on this perilous journey.")
    elseif not is_gm and e.other:DoesAnyPartyMemberHaveLockout(expedition_name, "Replay Timer", 6) then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'I'm afraid I cannot allow you to begin, someone in your party has been on this expedition too recently and cannot yet go again.'")
    else
      e.other:Message(MT.NPCQuestSay, ("Kenra Kalekkio says, 'Then I bid you good luck on your journeys, %s. Make haste into the temple and, hopefully, by the time we meet again you'll have recovered the relics and passed the final test.'"):format(e.other:GetCleanName()))
      local dz = e.other:CreateExpedition(expedition_info)
      if dz.valid then
        dz:AddReplayLockout(eq.seconds("1h"))
      end
    end
  end
end

function event_trade(e)
  local qglobals = eq.get_qglobals(e.other)

  local has_kevren_flag = (tonumber(qglobals.ikky) and tonumber(qglobals.ikky) >= 1)
  local finished_first_trial = (tonumber(qglobals.ikky) and tonumber(qglobals.ikky) >= 2)
  local finished_second_trial = (tonumber(qglobals.ikky) and tonumber(qglobals.ikky) >= 3)
  local finished_third_trial = (tonumber(qglobals.ikky) and tonumber(qglobals.ikky) >= 4)

  local item_lib = require("items")

  if item_lib.check_turn_in(e.trade, { item1 = 60154 }) then -- Item: Thrice-Notched Arrow Remains
    if not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'You are no doubt a brave adventurer and I wish you well, but you must first speak with Kevren Nalavat about the trials and the dangers that await you before I can accept this. According to my records, you must complete the previous two trials and prove your abilities with those before I can take this from you and claim that you have finished the final trial. Good luck.'")
      e.other:SummonItem(60154) -- Item: Thrice-Notched Arrow Remains
    elseif not finished_first_trial then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'I value your abilities and hope you do not spite me for what I am about to say, but you must complete the first trial before I can accept that from you. Please see Gazak Klelkek and inquire about finishing that trial before moving on.'")
      e.other:SummonItem(60154) -- Item: Thrice-Notched Arrow Remains
    elseif not finished_second_trial then
      e.other:Message(MT.NPCQuestSay, "Kenra Kalekkio says, 'You have no doubt fought hard for this, however I cannot accept this from you until you have proven your worth with the second trial. Please visit Maroley Nazuey and speak with her about it.'")
      e.other:SummonItem(60154) -- Item: Thrice-Notched Arrow Remains
    else
      e.other:Message(MT.NPCQuestSay, ("Kenra Kalekkio says, 'I am astounded that you have completed the trial so easily! You have gone above and beyond our expectations and are ready to continue beyond mere trials! Congratulations, %s! At this time, you should return to Kevren so he can guide you on your way from here on out.'"):format(e.other:GetCleanName()))
      if not finished_third_trial then
        eq.set_global("ikky", "4", 5, "F");
        e.other:AddEXP(1)
      end
    end
  end

  item_lib.return_items(e.self, e.other, e.trade)
end
