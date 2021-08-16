-- Gives Ikkinz Group 2 Expedition
-- Maroley_Nazuey NPCID: 293116
-- items: 60153
local expedition_name = "Ikkinz, Chambers of Twin Struggles"
local dz_version = instance_version.ikkinz_chambers_of_twin_struggles

local expedition_info = {
  expedition = { name=expedition_name, min_players=1, max_players=6 },
  instance   = { zone="ikkinz", version=dz_version, duration=eq.seconds("3h") },
  compass    = { zone="kodtaz", x=-701.0, y=-1717.0, z=-430.5 },
  safereturn = { zone="kodtaz", x=-693.0, y=-1744.0, z=-427.0, h=0.0 },
  zonein     = { x=-157.0, y=23.0, z=-2.0, h=256.0 }
}

function event_say(e)
  local qglobals = eq.get_qglobals(e.other);

  local is_gm = (e.other:Admin() > 80 and e.other:GetGM())
  local has_kevren_flag = (is_gm or (tonumber(qglobals.ikky) and tonumber(qglobals.ikky) >= 1))
  local finished_first_trial = (is_gm or (tonumber(qglobals.ikky) and tonumber(qglobals.ikky) >= 2))
  local finished_second_trial = (tonumber(qglobals.ikky) and tonumber(qglobals.ikky) >= 3)

  local preflag_key = string.format("%s-ikkinz_group2_maroley", e.other:CharacterID())

  if e.message:findi("hail") then
    if not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'Keep low and out of sight! I don't want to be caught by any wandering invaders because of your idiocy! What are you doing here anyway? I have no business with you! If you're looking for something to do, you might think about speaking with Kevren Nalavat near the mountain pass.'")
    elseif not finished_first_trial then
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'Gah, what do you think you're doing causing all that ruckus? I'm trying to keep a low profile so no wandering Muramites come to investigate noise. I may be the liaison for this temple, but that doesn't mean you can blow my cover! In any case, you still need to find Gazak and attempt the first trial before you can go any farther! Now make haste!'")
    elseif not finished_second_trial then
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'At last you have arrived. I have heard that you passed the trial at the Temple of Singular Might without any problems and I congratulate you on your achievement. Do not believe for a moment that you are done! Your next trial will be more difficult than the last. Are you ready to hear [" .. eq.say_link("what's in store") .. "] for you beyond the temple exterior?'")
    else
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'Though you have already completed the second trial, we will allow you to continue to hone your skills in the temple.  If you would like to [" .. eq.say_link("test your mettle") .. "] against the priests again, tell me so, and I will begin preparations for you. You must be warned once more that we have no control over the strength of the beasts that lay inside these temples.'")
    end
  elseif e.message:findi("store") then
    if not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'You're nowhere near prepared for what's in store. You're not even ready to begin the trials. You should definitely speak with Kevren Nalavat to the north before coming to me.'")
    elseif not finished_first_trial then
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'I don't think you're ready for what's in store for you. You'll need to complete the first trial before I give you any insight to the second.'")
    else
      e.other:Message(MT.NPCQuestSay, "Maroley glances toward the temple. 'The Muramites have sent priests to this temple. These priests are not ordinary, in fact, they are terrible, horrific beings sent to collect artifacts for a singular purpose. What this purpose is we are not clear on, but we believe it has something to do with a summoning of some sort. If you're willing to [" .. eq.say_link("test your mettle") .. "] in this trial, now is the time for action.'")
    end
  elseif e.message:findi("test(.*)mettle") then
    if not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'If you're trying to be funny, you're failing miserably. I don't think you're ready to test your mettle on even the simplest of tasks, but that is not for me to decide. Go speak with Kevren Nalavat to the north about beginning the trials.'")
    elseif not finished_first_trial then
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'I'm glad you think you're ready to test your mettle here, but you have yet to finish the first trial. Go back and speak with Gazak Klelkek at the Temple of Singular Might, he's waiting for you.'")
    else
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'The rumor we have been investigating suggests that the summoning will be a beast of war that is far more destructive than anything we may have seen so far. The Muramite [" .. eq.say_link("priests") .. "] working inside this temple are gathering artifacts of corporeal power that will grant the beast an unusual physical strength when it is conjured. We must make sure that they do not finish this summoning.'")
    end
  elseif e.message:findi("priest") then
    if not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'You're not even prepared to start the trials, yet you come to me spouting off random things about priests? You're either attempting to be very witty, or you're just not that bright. In either case, you should probably talk to Kevren Nalavat to the north about starting the trials. Good luck, I have a feeling you'll need it.'")
    elseif not finished_first_trial then
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'What's this about priests? Don't you think you should finish up the first trial before you come to me with visions of priests? Go find Gazak Klelkek at the Temple of Singular Might, I'm sure he'll have more information for you on that trial.'")
    else
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'I nearly forgot. You must venture inside to an entrance to the inner chambers of the Temple of Twin Struggles and enter there. Once inside you must find the Malevolent Priests. We have begun referring to them thusly because of their torturous looks and ways. They are very unpleasant and work cooperatively. You must get to them and [" .. eq.say_link("recover the artifacts") .. "] they have been gathering before they are allowed to move them to another temple nearby.'")
    end
  elseif e.message:findi("recover(.*)artifact") then
    if not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'You're in no position to start recovering any artifacts. You haven't even made preparations to start the trials, let alone collect artifacts from the temple. Go find Kevren Nalavat to the north and speak to him about the trials. I have no doubt he'll be able to guide you along the correct path.'")
    elseif not finished_first_trial then
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'I'm afraid I can't allow you to attempt to recover any artifacts for me until you're finished the first trial. You need to find Gazak Klelkek first. Maybe after you've completed the first trial we can talk about artifacts.'")
    else
      e.other:Message(MT.NPCQuestSay, ("Maroley Nazuey says, 'This is your moment, %s. Now is the time to prove your worth to the brotherhood. I bid you good luck and hope that the strength you showed in the first trial will aid you again in your second one. When you are [" .. eq.say_link("ready to enter the temple") .. "] and have a group with you, return to me and I shall set you on your way.'"):format(e.other:GetCleanName()))
      eq.set_data(preflag_key, "1")
    end
  elseif e.message:findi("ready(.*)enter(.*)temple") then
    if not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'No, I don't believe you are ready to enter this temple. You haven't even begun your preparations to start the first trial, let alone enter this temple. You must find Kevren Nalavat to the north and speak to him about the trials first.'")
    elseif not finished_first_trial then
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'I imagine you may think you're ready to enter this temple, but I can assure you that you are not. You must complete the first trial before you will be allowed entrance to this temple. Seek out Gazak Klelkek at the Temple of Singular Might for more information on the first trial.'")
    elseif not is_gm and eq.get_data(preflag_key) == "" then
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'What's that you say? You're ready to enter this temple? I don't remember speaking to you about [" .. eq.say_link("what's in store") .. "] for you here.'")
    elseif not is_gm and e.other:GetGroupMemberCount() < 2 then -- live probably missing speak_mode say flag here
      e.other:Message(MT.NPCQuestSay, "I'm sorry, but you don't have enough comrades with you to venture into this dangerous area. Come back when you have at least two friends to join you on this perilous journey.")
    elseif not is_gm and e.other:DoesAnyPartyMemberHaveLockout(expedition_name, "Replay Timer", 6) then
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'I'm afraid I cannot allow you to begin, someone in your party has been on this expedition too recently and cannot yet go again.'")
    else
      e.other:Message(MT.NPCQuestSay, ("Maroley Nazuey says, 'Good luck then, %s. Perhaps I will see you again soon and, by that time, I hope you have the artifact in your possession.'"):format(e.other:GetCleanName()))
      local dz = e.other:CreateExpedition(expedition_info)
      if dz.valid then
        dz:AddReplayLockout(eq.seconds("1h"))
      end
    end
  end
end

function event_trade(e)
  -- load the current qglobals
  local qglobals = eq.get_qglobals(e.other);
  local has_kevren_flag = (tonumber(qglobals.ikky) and tonumber(qglobals.ikky) >= 1)
  local finished_first_trial = (tonumber(qglobals.ikky) and tonumber(qglobals.ikky) >= 2)
  local finished_second_trial = (tonumber(qglobals.ikky) and tonumber(qglobals.ikky) >= 3)

  local item_lib = require("items")

  if item_lib.check_turn_in(e.trade, {item1 = 60153}) then -- Item: Stained Stone Chalice
    if not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'I understand your willingness to better yourself, but I'm afraid I must insist that you speak with Kevren Nalavat to start the trials. Once I have heard from him and know that you are indeed capable, and once you have completed the first trial, I will have no problem taking that artifact from you and rewarding you appropriately.'")
      e.other:SummonItem(60153); -- Item: Stained Stone Chalice
    elseif not finished_first_trial then
      e.other:Message(MT.NPCQuestSay, "Maroley Nazuey says, 'I'm afraid I cannot accept this from you until you have completed the first trial. Please speak with Gazak Klelkek about that trial so that we can proceed normally.'")
      e.other:SummonItem(60153); -- Item: Stained Stone Chalice
    else
      e.other:Message(MT.NPCQuestSay, string.format("Maroley Nazuey says, 'You've done well, %s. I believed this temple was more than you could handle despite your success with the first temple. You faced two enemies at once and came back in one piece. You only have one trial left to complete before you can proceed onto more difficult tasks. Please return to Kevren for information on the final trial. Good luck!'", e.other:GetCleanName()))
      if not finished_second_trial then
        eq.set_global("ikky", "3", 5, "F")
        e.other:AddEXP(1)
      end
    end
  end

  item_lib.return_items(e.self, e.other, e.trade)
end
