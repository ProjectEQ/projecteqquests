-- items: 68298
local turned_in_seal = false
local tool_count = 0

local function update_flag(client)
  local sewers_flag = tonumber(eq.get_data(client:CharacterID() .. "-god_sewers")) or 0
  local snlair_key = string.format("%s-god_snlair", client:CharacterID())

  if sewers_flag < 3 then
    eq.set_data(snlair_key, "T")
    client:Message(15, "You have gained a temporary character flag!  Seek the High Priest's Scribe to find out more information.")
  else
    eq.set_data(snlair_key, "1")
    client:Message(15, "You have gained a character flag!  All of High Priest Diru's tasks have been completed.  He will now tell you who to talk to for passage through the mountains.")
  end
end

function event_spawn(e)
  e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1)
  e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1)
  e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1)
  e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1)
  e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1)

  eq.set_timer("appearance", 1000)
  eq.spawn_condition("snlair", eq.get_zone_instance_id(), 1, 1) -- default mobs inside tool rooms
end

function event_say(e)
  if e.message:findi("hail") then
    if not turned_in_seal then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Alej Leraji in a raspy, tired voice says, 'Who are you? What are you doing here?'")
    else
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Alej Leraji says, 'Please hurry and [" .. eq.say_link("find my three stone shaping tools") .. "], there isn't time to waste!'")
    end
  elseif e.message:findi("found(.*)stone shaping tool") then
    if tool_count == 0 then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Alej Leraji says, 'I don't see any tools. Please acquire my three tools so I can escape this collapsed prison!'")
    elseif tool_count == 1 then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Alej Leraji says, 'You are missing two of my tools. Please acquire them so I can escape this stony bastille!'")
    elseif tool_count == 2 then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Alej Leraji says, 'You only need one more tool. Please acquire it before there is no time left!'")
    elseif tool_count == 3 then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Alej Leraji uses his stone shaping tools to lessen the grasp the stone prison had on his body. In an extremely hasty motion he leaps from under the rocks. Alej Leraji tells you, 'Thank you for helping me out of this situation. For a while I thought I was going to be joining the rest of the spirits here an in eternal slumber, but that is not the case now. Thank you! .' A burst of light flashes before your eyes and Alej disappears.")

      local client_list = eq.get_entity_list():GetClientList()
      for client in client_list.entries do
        if client.valid then
          update_flag(client)
        end
      end

      eq.depop()
    end
  end
end

function event_timer(e)
  if e.timer == "appearance" then
    eq.stop_timer("appearance")
    e.self:SetAppearance(3)
  elseif e.timer == "fail_warn" then
    eq.zone_emote(13, "Alej Leraji shouts, 'Please hurry, I do not know how much longer I can hold on underneath these rocks!'")
    eq.stop_timer("fail_warn")
    eq.set_timer("fail_event", 10 * 60 * 1000) -- 10 minutes
  elseif e.timer == "fail_event" then
    eq.zone_emote(13, "With his very last breath Alej shouts, 'My time is up, I'm beginning to feel my life wither. Thank you for trying friends, if only there was more time.'")
    eq.stop_timer("fail_event")
    eq.depop()
  end
end

function event_trade(e)
  local item_lib = require("items")

  if item_lib.check_turn_in(e.trade, {item1 = 68298}) then -- Item: Seal of the Nihil High Priest
    turned_in_seal = true
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Alej Leraji looks at the clay seal and with a tired breath says, 'I see you have the seal, you are trustworthy. I need your help, for I don't know if I can survive much longer. I will need my stone shaping tools to get me out of this rocky prison. Please tell me when you [" .. eq.say_link("find my three stone shaping tools") .. "] and make haste! I left them in the water wheel room, the cocoon room, and the entrance to this section of the sewers.  I have little time left.'")
    eq.spawn2(286104, 0, 0, 10, 10, 10, 0) -- NPC: #lair_trigger (spawns event tool room mobs)
    eq.set_timer("fail_warn", 50 * 60 * 1000) -- 50 minutes
  end

  item_lib.return_items(e.self, e.other, e.trade)
end

function event_signal(e)
  if e.signal == 1 then
    tool_count = tool_count + 1
  end
end
