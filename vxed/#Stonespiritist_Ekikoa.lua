local flagged_count = 0

local function update_flags(client, make_permanent)
  -- temp vxed flag is converted to permanent at Scribe Gurru once sewers or rondo completed
  local vxed_flag_key = string.format("%s-god_vxed", client:CharacterID())
  local has_temp_vxed = eq.get_data(vxed_flag_key) == "T"

  -- was able to flag 7 characters on live (2 permanent, 5 temporary) and didn't
  -- have enough characters to test limits. this is an assumption that live still
  -- has a limit to prevent excessive dzadd flagging
  eq.debug(string.format("flagged count [%s]", flagged_count))

  if flagged_count >= 7 or has_temp_vxed then
    client:Message(MT.NPCQuestSay, "Ekikoa tells you, 'I'm afraid that I have already aided as many as I can, I do not have the strength to assist you further.'")
  elseif make_permanent then
    client:Message(MT.NPCQuestSay, "Ekikoa tells you, 'This stone behind me is a shard of an Attunement Obelisk.  With a unique and ancient magic, we can attune spirits to this farstone to allow travel.  When you touch it, the stone will be imprinted with your essence, because this is only a section of an obelisk, more must be done in order to have full use of these obelisks.  Now, when you touch this stone, you will be sent back to Udranda.  She will tell you what you must do next when you are ready.'")
    client:Message(15, "You feel at one with the Attunement Obelisk and feel the power of the earth moving through you.")
    eq.set_data(vxed_flag_key, "1")
    eq.set_global("god_tipt_access", "1", 5, "F")
    flagged_count = flagged_count + 1
  else
    client:Message(MT.NPCQuestSay, "Ekikoa tells you, 'I'm afraid I can do nothing to aid you.  You have not proven yourself to be a faithful friend of my people.  You must complete High Priest Diru's tasks before I can be permitted to grant you access to our sacred magic.'")
    client:Message(15, "You have gained a temporary character flag!  Seek the High Priest's Scribe to find out more information.")
    eq.set_data(vxed_flag_key, "T")
    flagged_count = flagged_count + 1
  end
end

function event_spawn(e)
  eq.zone_emote(15, "A series of low chants comes to you from the Northeast, as Stonespiritist Ekikoa emerges from the shadows.")
end

function event_say(e)
  local qglobals = eq.get_qglobals(e.other)
  local has_vxed_access = (qglobals.god_vxed_access and qglobals.god_vxed_access == "1") -- sewers or rondo complete
  local has_tipt_access = (qglobals.god_tipt_access and qglobals.god_tipt_access == "1") -- permanent vxed flag complete

  if e.message:findi("hail") and not has_tipt_access then
    if has_vxed_access then -- sewers progression completed dialogue (untested with smith rondo flag)
      e.other:Message(MT.NPCQuestSay, "Ekikoa tells you, 'Ah, help has come.  I was told to expect friendly creatures from a distant land and here you are.  You are as alien as the others, but I know you have done good deeds for Udranda to send you here.  Now, I will tell you what you came for.  Obviously, the way to the temples is blocked. However, I [" .. eq.say_link("tend") .. "] to something very special here to overcome that problem.'")
    else
      update_flags(e.other, has_vxed_access)
    end
  elseif e.message:findi("tend") and not has_tipt_access then
    update_flags(e.other, has_vxed_access)
  end
end
