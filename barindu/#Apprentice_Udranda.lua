-- same for vxed and tipt
local compass = { "barindu", -1249.24, 575.142, -148.257 }
local safereturn = { "barindu", -1242.00, 456.00, -121.76, 0.0 }
local vxed_zonein = { -427.0, -3552.0, 14.99, 463.0 }
local tipt_zonein = { -448.0, -2374.0, 13.16, 395.0 }

local vxed = {
  expedition_info = { "Vxed, The Crumbling Caverns", 1, 6 },
  dz_info = { "vxed", 0, eq.seconds("6h"), compass = compass, safereturn = safereturn, zonein = vxed_zonein }
}

local tipt = {
  expedition_info = { "Tipt, Treacherous Crags", 1, 6 },
  dz_info = { "tipt", 0, eq.seconds("6h"), compass = compass, safereturn = safereturn, zonein = tipt_zonein }
}

local paladin_epic = {
  expedition_info = { "Vxed, The Crumbling Caverns", 6, 24 },
  dz_info = { "vxed", 1, eq.seconds("6h"), compass = compass, safereturn = safereturn, zonein = vxed_zonein }
}

local function create_expedition(client, expedition)
  local dz = client:CreateExpedition(expedition.dz_info, expedition.expedition_info)
  if dz.valid then
    dz:AddReplayLockout(eq.seconds("5m"))
  end
end

function event_say(e)
  local qglobals = eq.get_qglobals(e.other)
  local has_vxed_access = (qglobals.god_vxed_access and qglobals.god_vxed_access == "1") -- sewers or rondo complete
  local has_tipt_access = (qglobals.god_tipt_access and qglobals.god_tipt_access == "1") -- has_permanent_vxed

  local sewers_flag = tonumber(eq.get_data(e.other:CharacterID() .. "-god_sewers")) or 0
  eq.debug(string.format("sewers[%s] vxed_access[%s] tipt_access[%s]", sewers_flag, has_vxed_access, has_tipt_access))

  local is_gm = (e.other:Admin() > 80 and e.other:GetGM())

  -- Smith Rondo skip flag was not tested on live, will just bypass sewers progression dialogue here
  if e.message:findi("hail") then
    if e.other:GetClass() == Class.PALADIN and e.other:HasItem(69933) then -- Item: Seal of Enic
      e.other:Message(MT.NPCQuestSay, string.format("I heard you released Reiya from his tourture, %s. I have seen muramites gathering in Vxed and I fear this may have to do with Reiya and the creatures responsible. Go there now and investigate, Noble Knight.", e.other:GetCleanName()))
      create_expedition(e.other, paladin_epic)
    elseif sewers_flag == 4 and not has_tipt_access then -- sewers progression dialogue
      -- note: live dialogue is always here if finished sewers, checking tipt access flag here avoids this live "bug"
      e.other:Message(MT.NPCQuestSay, "Udranda looks around sheepishly.  'Greetings.  A messenger told me you would come.  I believe we owe you our thanks -- though I'm not sure allowing you to face the terror in the mountains is a reward.  I will have my stone worker allow you to pass through, but you must [" .. eq.say_link("take heed") .. "] first and be as quiet as you can.'")
    else
      e.other:Message(MT.NPCQuestSay, "Udranda tells you, 'Greetings.  I have a duty here to stand guard at the mountain pass and allow the Muramites to pass through by moving the rocks with my magic.'  Udranda looks around for anyone listening and whispers to you. 'If you want to go into [" .. eq.say_link("Tipt") .. "] or [" .. eq.say_link("Vxed") .. "] I will have my stone worker open the passage for you.  If you want to progress past the mountains, I would ask that you first prove your worth with High Priest Diru.'")
    end
  elseif e.message:findi("take heed") and not has_tipt_access then -- no longer responds to this after receiving permanent vxed completed flag
    if sewers_flag == 4 or has_vxed_access then
      e.other:Message(MT.NPCQuestSay, "Udranda tells you, 'Good.  There are many secrets I can't tell you right now for fear the Muramites might hear them, but you must do as I say and trust in me.  In the mountain pass, Vxed, you must seek out Stonespiritist Ekikoa.  He is my mentor and will help you in your quest to find passage to the peaks.  We have created a very unique magic that we will share with you, but you must speak with him.  It will all be clear to you when you find him.  Tell me when you are [" .. eq.say_link("ready to pass") .. "] through.  I cannot leave a way open for too long.'")
      create_expedition(e.other, vxed) -- no emote when creating here
    else -- same message as hailing without progression
      e.other:Message(MT.NPCQuestSay, "Udranda tells you, 'Greetings.  I have a duty here to stand guard at the mountain pass and allow the Muramites to pass through by moving the rocks with my magic.'  Udranda looks around for anyone listening and whispers to you. 'If you want to go into [" .. eq.say_link("Tipt") .. "] or [" .. eq.say_link("Vxed") .. "] I will have my stone worker open the passage for you.  If you want to progress past the mountains, I would ask that you first prove your worth with High Priest Diru.'")
    end
  elseif e.message:findi("ready to pass") and not has_tipt_access then
    -- only responds without permanent vxed flag, possibly old dialogue to request tipt that was removed
    e.other:Message(MT.NPCQuestSay, "Udranda tells you, 'I cannot allow you to pass with your companions.  You seem heroic enough, but you must prove your worth to High Priest Diru and our stonespiritist in the Vxed mountain pass before I can allow you through.'")
  elseif e.message:findi("tipt") and (is_gm or has_tipt_access) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, e.self:GetCleanName() .. " subtly commands her stone worker to open the passage for you before any invaders can take notice.")
    create_expedition(e.other, tipt)
  elseif e.message:findi("vxed") and (is_gm or has_vxed_access) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, e.self:GetCleanName() .. " subtly commands her stone worker to open the passage for you before any invaders can take notice.")
    create_expedition(e.other, vxed)
  end
end

function event_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end