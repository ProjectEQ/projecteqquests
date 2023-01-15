-- Scribe_Gurru NPCID:283052
local function convert_temp_flag(client, flag_name, flag_msg)
  -- Note: characters on live that received a temporary flag will forever receive
  -- "temporary" messages when repeating expeditions even after made permanent.
  -- Just a quirk in their priority flag checks (they probably use a separate flag)
  client:Message(MT.NPCQuestSay, string.format("Gurru tells you, 'I see that you have helped your friends accomplish things in %s.  I will tell the High Priest of your deeds.  You should seek an audience with him and see if there is anything else that you can help us with.'", flag_msg))
  eq.set_data(string.format("%s-%s", client:CharacterID(), flag_name), "1")
  client:Message(15, "Your temporary character flag has been converted into a permanent flag!")
  eq.debug(string.format("Converted character [%s] temporary flag [%s] to permanent", client:GetName(), flag_name))
end

local function update_sewers_flag(char_id, minimum_flag)
  local sewer_flag_key = string.format("%s-god_sewers", char_id)
  local sewers_flag = tonumber(eq.get_data(sewer_flag_key)) or 0

  if sewers_flag < minimum_flag then
    eq.set_data(sewer_flag_key, tostring(minimum_flag))
  end
end

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Scribe Gurru says, 'Please do not bother the High Priest with petty issues, he has enough on his mind.  If you have other [" .. eq.say_link("issues") .. "] to discuss let me know.'")
  elseif e.message:findi("issues") then
    -- converts temporary flags into permanent flags if at right point in progression
    -- temporary flags are from completing expeditions with others outside progression
    local qglobals = eq.get_qglobals(e.other)
    local has_vxed_access = (qglobals.god_vxed_access and qglobals.god_vxed_access == "1") -- sewers or rondo complete
    local has_tipt_access = (qglobals.god_tipt_access and qglobals.god_tipt_access == "1") -- has_permanent_vxed

    local char_id = e.other:CharacterID()

    local snplant     = eq.get_data(("%s-god_snplant"):format(char_id))
    local sncrematory = eq.get_data(("%s-god_sncrematory"):format(char_id))
    local snlair      = eq.get_data(("%s-god_snlair"):format(char_id))
    local snpool      = eq.get_data(("%s-god_snpool"):format(char_id))
    local vxed        = eq.get_data(("%s-god_vxed"):format(char_id))
    local tipt        = eq.get_data(("%s-god_tipt"):format(char_id))

    -- permanent flag for previous sewer indicates character is on that step
    -- update main sewers flag for accurate dialogue (high priest hails not required)

    if snplant == "T" then
      convert_temp_flag(e.other, "god_snplant", "the Purifying Plant")
      update_sewers_flag(char_id, 1)
    elseif sncrematory == "T" and snplant == "1" then
      convert_temp_flag(e.other, "god_sncrematory", "the Crematory")
      update_sewers_flag(char_id, 2)
    elseif snlair == "T" and sncrematory == "1" then
      convert_temp_flag(e.other, "god_snlair", "the Lair of Trapped Ones")
      update_sewers_flag(char_id, 3)
    elseif snpool == "T" and snlair == "1" then
      convert_temp_flag(e.other, "god_snpool", "the Pool of Sludge")
      update_sewers_flag(char_id, 4)
    elseif vxed == "T" and (snpool == "1" or has_vxed_access) then -- finished sewers or has rondo skip
      convert_temp_flag(e.other, "god_vxed", "Vxed")
      eq.set_global("god_tipt_access", "1", 5, "F")
    elseif tipt == "T" and has_tipt_access then -- must have completed permanent vxed
      convert_temp_flag(e.other, "god_tipt", "Tipt")
      eq.set_global("god_kodtaz_access", "1", 5, "F")
    else
      e.other:Message(MT.NPCQuestSay, "Gurru tells you, 'I see that you have completed some deeds for our people and we appreciate it.  Before I can tell the High Priest of your work though, you will need to talk to him and finish some other tasks.'")
    end
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end
