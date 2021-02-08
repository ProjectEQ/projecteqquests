-- items: 55608, 55609, 55610, 55611
local function update_flag(client)
  local sewers_flag = tonumber(eq.get_data(client:CharacterID() .. "-god_sewers")) or 0
  local sncrematory_key = string.format("%s-god_sncrematory", client:CharacterID())

  if sewers_flag < 2 then
    eq.set_data(sncrematory_key, "T")
    client:Message(15, "You have gained a temporary character flag!  Seek the High Priest's Scribe to find out more information.")
  else
    eq.set_data(sncrematory_key, "1")
    client:Message(15, "You have gained a character flag!  Freedom for the souls that were trapped should earn the respect of High Priest Diru.")
  end
end

function event_spawn(e)
  e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1)
  e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1)
  e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1)
  e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1)
  e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1)

  eq.zone_emote(15, "A ghostly voice calls out, 'You have freed the spirits of the suffering.  Hurry now to the crystal room in the east.  There we shall complete the Ceremony.  Make haste, for time is short!")
  eq.set_timer("depop", eq.seconds("12m25s") * 1000)
end

function event_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Gzifa the Pure One says, 'You have destroyed the abominations that my brethren have become.  The invaders struck before the Ceremony of Kiruatuk could be completed.  Because of that their destiny was to wander these halls in undeath for forever more.  Faced with the prospect of living life as an abomination of their former selves, they were driven mad.  Now that you have separated their pure essence from their twisted, corrupted form, we can begin the Ceremony of Kiruatuk. Hand me the remains of Ngozi, Mabiki, Yogundi, and Talakoi and I shall begin the ceremony.'")
  end
end

function event_timer(e)
  if e.timer == "depop" then
    -- timers may be bugged on live so guessing intent here. this npc depops
    -- at 12m25s but zone emote and evil essences spawned at 50m
    eq.signal(288086, 1) -- NPC: a_ghostly_essence
    eq.zone_emote(15, "Gzifa the Pure shouts, 'You have failed to start the ceremony in time!  You shall now feel the wrath of my brethren!'")
    eq.depop()
  end
end

function event_trade(e)
  local item_lib = require("items")

  -- Items: Ngozi's Remains, Mabiki's Remains, Talakoi's Remains, Yogundi's Remains
  if item_lib.check_turn_in(e.trade, {item1 = 55608, item2 = 55609, item3 = 55610, item4 = 55611}) then
    eq.stop_timer("depop")
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Gzifa the Pure One begins to chant in an unknown tongue.  The essences of the ghosts you destroyed merge with the crystal in the center of the room.  As they do so, a flash of magic erupts, briefly illuminating the crystal.  'It is complete.  Our time here is done.  We thank you for your good deed.  We bid you farewell.'")

    local client_list = eq.get_entity_list():GetClientList()
    for client in client_list.entries do
      if client.valid then
        update_flag(client)
      end
    end

    eq.signal(288064, 1) -- Invisible NPC: "_" (for spell effect on blue crystal)
    eq.depop_all(288086) -- a_ghostly_essence
    eq.depop()
  end

  item_lib.return_items(e.self, e.other, e.trade)
end
