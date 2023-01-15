-- Gives Ikkinz Group 1 Expedition
-- Gazak_Klelkek NPCID: 293117
-- items: 60152

-- ikkinz group expeditions are repeatable without completing all 3 (ikkyredo not required)
-- expedition requests have custom dialogue for some expedition requirements
-- live only checks requesters group (even w/raid) for anyone with lockout for custom dialogue
-- requester is required to be in group with at least 1 person (group can be in a raid)
-- the real minimum is 2 due to the group requirement even though expedition is set to 1
local expedition_name = "Ikkinz, Chambers of Singular Might"
local dz_version = instance_version.ikkinz_chambers_of_singular_might

-- live uses min players 1 but checks for a group manually (confirmed via a
-- player count conflict message using a raid prior to September 16, 2020 changes)
local expedition_info = {
  expedition = { name=expedition_name, min_players=1, max_players=6 },
  instance   = { zone="ikkinz", version=dz_version, duration=eq.seconds("3h") },
  compass    = { zone="kodtaz", x=-500.0, y=-1145.0, z=-384.5 },
  safereturn = { zone="kodtaz", x=-504.0, y=-1165.0, z=-381.0, h=0.0 },
  zonein     = { x=-157.0, y=23.0, z=-2.0, h=256.0 }
}

function event_say(e)
  local qglobals = eq.get_qglobals(e.other);

  local is_gm = (e.other:Admin() > 80 and e.other:GetGM())
  local has_kevren_flag = (is_gm or (tonumber(qglobals.ikky) and tonumber(qglobals.ikky) >= 1))
  local finished_first_trial = (tonumber(qglobals.ikky) and tonumber(qglobals.ikky) >= 2)

  local preflag_key = string.format("%s-ikkinz_group1_gazak", e.other:CharacterID())

  if(e.message:findi("hail")) then
    if not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, "Gazak Klelkek says, 'My, you have ventured deep into these temple areas. Look around you, do you see anything here that warrants a lone adventurer being out on his own? If you are looking to be of some assistance, you should try speaking with Kevren Nalavat to the north. I must be on the lookout for anyone proceeding with the trials.'")
    elseif not finished_first_trial then
      e.other:Message(MT.NPCQuestSay, "Gazak Klelkek says, 'Keep your voice down! We must not attract any [" .. eq.say_link("undo attention") .. "] to ourselves here. I may be the liaison for the Temple of Singular Might, but that doesn't make me any less of a target. I have kept watch of this temple since we began collecting information on the trusik and the Legion of Mata Muram. You should ask Kevren for more information on them if you haven't already.'")
    else
      e.other:Message(MT.NPCQuestSay, "Gazak Klelkek says, 'Though you have already completed the first trial we can always use someone to eradicate a ferocious beast. If you are looking for something else to do, return to Kevren Nalavat to see if he has anything else in store for you. If you want to attempt this trial again and [" .. eq.say_link("eradicate the beast") .. "], just tell me so and I will prepare you for your trial.'")
    end
  elseif (e.message:findi("undo(.*)attention")) then
    if not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, "Gazak Klelkek says, 'What do you mean? I suppose it doesn't matter. You can't be here for the first trial. You should probably speak with Kevren Nalavat to the north.'")
    else
      e.other:Message(MT.NPCQuestSay, "Gazak Klelkek says, 'Certainly you do not believe that we are alone here, do you? The Muramites have assigned one of their magic users to gather spiritual artifacts from this area and use their power to gain strength. This creature, which we have dubbed the [" .. eq.say_link("Diabolic Destroyer") .. "], controls the temple and its inner abominations.'")
    end
  elseif (e.message:findi("Diabolic(.*)Destroyer")) then
    if not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, "Gazak Klelkek says, 'I don't know that I can trust you with that information yet. You should probably speak with Kevren Nalavat to the north if you wish to learn more about the first trial.'")
    else
      e.other:Message(MT.NPCQuestSay, "Gazak Klelkek says, 'It is one of a fearsome collective that commands minions to do its bidding. The beast's minions recover the artifacts from within the temple. The master then extracts the energy from the artifact to become more powerful. You and your party must venture inside the temple and [" .. eq.say_link("eradicate the beast") .. "] before it can recover any more artifacts. The Muramites will reinforce their position shortly after it has been defeated, but we cannot allow any single creature of this sort to become too powerful.'")
    end
  elseif (e.message:findi("eradicate(.*)beast")) then
    if not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, "Gazak Klelkek says, 'You're not ready to eradicate any kind of beast. You still need to speak to Kevren Nalavat about the trials if you're interested in such a thing.'")
    else
      e.other:Message(MT.NPCQuestSay, "Gazak Klelkek says, 'Your task is to battle through the temple and enter an entrance to the inner chambers of the Temple of Singular Might. Once inside you must find the Diabolic Destroyer and kill it before it becomes more powerful. You must recover an artifact from the beast and return it to me. Once you have done this, you will be allowed to move onto the next trial. When you are [" .. eq.say_link("ready to proceed") .. "] and have a group with you, return to me and I shall set you on your way.'")
      eq.set_data(preflag_key, "1")
    end
  elseif (e.message:findi("ready(.*)proceed")) then
    if not is_gm and not has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, "Gazak Klelkek says, 'I really don't believe you're ready to proceed with anything here. You have to speak with Kevren Nalavat to the north about the trials. Return to me when you have spoken with him.'")
    elseif not is_gm and eq.get_data(preflag_key) == "" then
      e.other:Message(MT.NPCQuestSay, "Gazak Klelkek says, 'Ready to proceed with what? I know I haven't spoken to you about the [" .. eq.say_link("Diabolic Destroyer") .. "], so that can't be it.'")
    elseif not is_gm and e.other:GetGroupMemberCount() < 2 then -- live probably missing speak_mode say flag here
      e.other:Message(MT.NPCQuestSay, "I'm sorry, but you don't have enough comrades with you to venture into this dangerous area. Come back when you have at least two friends to join you on this perilous journey.")
    elseif not is_gm and e.other:DoesAnyPartyMemberHaveLockout(expedition_name, "Replay Timer", 6) then
      e.other:Message(MT.NPCQuestSay, "Gazak Klelkek says, 'I'm afraid I cannot allow you to begin, someone in your party has been on this expedition too recently and cannot yet go again.'")
    else
      e.other:Message(MT.NPCQuestSay, ("Gazak Klelkek says, 'Very well then, %s. Good luck on your journey through the temple and may you prove to the brotherhood that you are more than meets the eye. The temple awaits...'"):format(e.other:GetCleanName()))
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
  local item_lib = require("items");
  if(item_lib.check_turn_in(e.trade, {item1 = 60152})) then
    if has_kevren_flag then
      e.other:Message(MT.NPCQuestSay, ("Gazak Klelkek says, 'Though you were pitted against a most heinous aggressor, you have proven that you are a capable adventurer thus far. Nicely done, %s. I urge you to continue honing your skills. Now that you are ready to move onto the next trial, you should return to Kevren for more information. Good luck!'"):format(e.other:GetCleanName()))
      if not finished_first_trial then
        eq.set_global("ikky", "2", 5, "F")
        e.other:AddEXP(1)
      end
    else
      e.other:Message(MT.NPCQuestSay, "Gazak Klelkek says, 'I appreciate that you must have fought hard for this, but I cannot accept it yet. Please speak with Kevren Nalavat about the trials and once I have received word that you are actually ready to do the trials, you can present it to me again.'")
      e.other:SummonItem(60152); -- Item: Ruined Pendant of Might
    end
  end
  item_lib.return_items(e.self, e.other, e.trade);
end
