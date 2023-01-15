local state = { None = 0, Spawned = 1, Killed = 2 }
local event = state.None
local stonemites_killed = 0

local function spawn_stonemites()
  eq.spawn2(287021, 0, 0, -71, -1613, -83.5, 322):ChangeSize(12) -- NPC: an_aged_stonemite
  eq.spawn2(287021, 0, 0, -71, -1590, -83.5, 378):ChangeSize(12) -- NPC: an_aged_stonemite
  eq.spawn2(287021, 0, 0, -71, -1562, -83.5, 448):ChangeSize(12) -- NPC: an_aged_stonemite
  eq.spawn2(287021, 0, 0, -42, -1613, -83.5, 258):ChangeSize(12) -- NPC: an_aged_stonemite
  eq.spawn2(287021, 0, 0, -42, -1590, -83.5, 169):ChangeSize(12) -- NPC: an_aged_stonemite
  eq.spawn2(287021, 0, 0, -42, -1562, -83.5, 0):ChangeSize(12) -- NPC: an_aged_stonemite
  eq.spawn2(287021, 0, 0, -18, -1613, -83.5, 169):ChangeSize(12) -- NPC: an_aged_stonemite
  eq.spawn2(287021, 0, 0, -18, -1590, -83.5, 125):ChangeSize(12) -- NPC: an_aged_stonemite
  eq.spawn2(287021, 0, 0, -18, -1562, -83.5, 65):ChangeSize(12) -- NPC: an_aged_stonemite
end

local function update_flag(client)
  local sewers_flag = tonumber(eq.get_data(client:CharacterID() .. "-god_sewers")) or 0
  local snplant_key = string.format("%s-god_snplant", client:CharacterID())

  if sewers_flag == 0 then -- never received preflag by hailing high priest
    eq.set_data(snplant_key, "T")
    client:Message(15, "You have gained a temporary character flag!  Andaru is happy that you have helped your friends slay the Ancient Kayserops.  Perhaps you should find the High Priest in Barindu and ask him how else you can help the Taelosians.")
  else
    eq.set_data(snplant_key, "1")
    client:Message(15, "You have gained a character flag!  The destruction of the Ancient Kayserops should earn the trust of High Priest Diru.")
  end
end

function aged_death(e)
  stonemites_killed = stonemites_killed + 1
  if stonemites_killed < 9 then
    eq.zone_emote(15, "As the last blow strikes the giant stonemite, it screeches in pain.  You can hear the rumbling of a huge stonemite making its way through the pipes.")
  elseif stonemites_killed == 9 and event == state.Spawned then
    eq.zone_emote(15, "The last of the old stonemites squeals in agony.  Just then, a massive stonecrawler bursts through the pipes and heads at you with vengeance.")
    eq.spawn2(287145, 0, 0, -45, -1616, -87, 380):ChangeSize(12) -- NPC: #Ancient_Kayserops
  end
end

function ancient_death(e)
  local dz = eq.get_expedition()
  if dz.valid then
    dz:SetLocked(true, ExpeditionLockMessage.Close)
  end

  event = state.Killed

  -- update client flags, anyone that died will receive a flag when they zone back in
  local client_list = eq.get_entity_list():GetClientList()
  for client in client_list.entries do
    if client.valid then
      update_flag(client)
    end
  end
end

function ansharu_spawn(e)
  e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1)
  e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1)
  e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1)
  e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1)
  e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1)
end

function ansharu_say(e)
  local sewers_flag = tonumber(eq.get_data(e.other:CharacterID() .. "-god_sewers")) or 0
  local snplant_complete = (eq.get_data(string.format("%s-god_snplant", e.other:CharacterID())) == "1")

  if e.message:findi("hail") then
    if sewers_flag == 0 then
      e.other:Message(MT.NPCQuestSay, "Ansharu tells you, 'Please, keep your voice down.  I am here against the wishes of the invaders.  I must study the entomology of the stonemites that infest this area of the sewers.  So now, you must leave from my sight before you draw attention to me.'")
    elseif sewers_flag == 1 and not snplant_complete then
      e.other:Message(MT.NPCQuestSay, "Ansharu tells you, 'Diru sent you yes?  I am so happy you have come to help us.  I have determined that the source of the problem lies in the alpha leader of these stonemites.  It is a large and ancient stonemite that I have named the Kayserops.  I noticed that when together with it they are able to move about more effectively, as if it is able to communicate with them where to go.  Without this alpha leader, I think they would lose this ability and may have a harder time finding their way in to the city.  Find the aged stonemites. I have seen the Kayserops protecting these elders.  Defeating them may draw its attention.'")
      if event == state.None then
        spawn_stonemites()
        event = state.Spawned
      end
    elseif sewers_flag == 1 then -- haven't hailed high priest after completing
      e.other:Message(MT.NPCQuestSay, "Ansharu tells you, 'I heard the squeal of the massive Kayserops even here.  Excellent work!  I hope that another leader does not rise to take its place any time soon.  You must go back and tell Diru of what has happened here!'")
    else
      e.other:Message(MT.NPCQuestSay, "Ansharu tells you, 'I heard from Diru that you have begun to help us in with our problems.  I cannot thank you enough for this.  Long have we been plagued with these invaders, and anything that you do to help gives us hope that one day we can live free.  Thank you again and safe journey to you.'")
    end
  end
end

function ansharu_trade(e)
  local item_lib = require("items")
  item_lib.return_items(e.self, e.other, e.trade)
end

function player_enter_zone(e)
  -- this is how live flags characters that may have died and missed flag on boss death
  if event == state.Killed then
    update_flag(e.self)
  end
end

function event_encounter_load(e)
  eq.register_npc_event("stonemites", Event.spawn, 287077, ansharu_spawn) -- Ansharu (version 0)
  eq.register_npc_event("stonemites", Event.say, 287077, ansharu_say) -- Ansharu (version 0)
  eq.register_npc_event("stonemites", Event.trade, 287077, ansharu_trade) -- Ansharu (version 0)

  eq.register_npc_event("stonemites", Event.spawn, 287136, ansharu_spawn) -- #Ansharu (version 1 unused)
  eq.register_npc_event("stonemites", Event.say, 287136, ansharu_say) -- #Ansharu (version 1 unused)
  eq.register_npc_event("stonemites", Event.trade, 287136, ansharu_trade) -- #Ansharu (version 1 unused)

  eq.register_npc_event("stonemites", Event.death_complete, 287021, aged_death) -- an_aged_stonemite
  eq.register_npc_event("stonemites", Event.death_complete, 287145, ancient_death) -- #Ancient_Kayserops

  eq.register_player_event("stonemites", Event.enter_zone, player_enter_zone)
end
