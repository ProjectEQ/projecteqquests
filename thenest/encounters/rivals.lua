-- note: rival npcs should start with some type of racial factions (dubious to amiable depending on player race)
local is_dark_reign   = false
local dark_reign_ids  = { [4855] = true, [4856] = true } -- Dark Reign mission versions
local spawn_condition = { good = 1, evil = 2 }

local npc_ids = {
  spider      = 343556, -- a_blackroot_spider
  goblin      = 343555, -- a_fireclaw_servant
  -- Norrath's Keepers version
  gimblemort  = 343564, -- #Gimblemort
  fahsheer    = 343563, -- #Fahsheer_Delure
  henry       = 343562, -- #Henry_Firemind
  ferrin      = 343561, -- #Ferrin_Stoneheart
  redeye      = 343559, -- #Redeyes_Lore_Eater
  bearsmasher = 343560, -- #Bearsmasher
  -- Dark Reign version
  melina      = 343717, -- #Melina_Fairwinter
  garrand     = 343718, -- #Garrand_Redmist
  wealgry     = 343719, -- #Wealgry_Windmiller
  evron       = 343720, -- #Evron_Sensitiveleaf
  risha       = 343721, -- #Risha_Farchaser
  filimar     = 343722, -- #Filimar_Starshaper
}

-- main goblin spawngroup id (if dead script continues but goblin does not shout)
local main_goblin = 279619

-- spawngroup ids of goblin/spider that first attack clients (same in both versions)
local client_attackers = { 279619, 279621 }

local good = { -- Norrath's Keepers version
  outer = { min_x = 1240, max_x = 1610, min_y = 2100, max_y = 2550 }, -- triggers script start
  inner = { min_x = 1430, max_x = 1529, min_y = 2230, max_y = 2320 }, -- triggers fight
  spawngroup_targets = { -- attacker spawngroup id to target spawngroup id
    [279626] = 279623, -- a_blackroot_spider attacks #Gimblemort
    [279625] = 279623, -- a_blackroot_spider attacks #Gimblemort
    [279624] = 279620, -- a_fireclaw_servant attacks #Henry_Firemind
    [279612] = 279615, -- a_blackroot_spider attacks #Redeyes_Lore_Eater
    [279611] = 279615, -- a_blackroot_spider attacks #Redeyes_Lore_Eater
    [279610] = 279617, -- a_fireclaw_servant attacks #Ferrin_Stoneheart
  },
}

local evil = { -- Dark Reign version
  outer = { min_x = -145, max_x = 140, min_y = 1460, max_y = 1860 }, -- triggers script start
  inner = { min_x = -150, max_x = 87,  min_y = 1570, max_y = 1700 }, -- triggers fight
  spawngroup_targets = { -- attacker spawngroup id to target spawngroup id
    [279626] = 287847, -- a_blackroot_spider attacks #Wealgry_Windmiller
    [279625] = 287847, -- a_blackroot_spider attacks #Wealgry_Windmiller
    [279624] = 287845, -- a_fireclaw_servant attacks #Evron_Sensitiveleaf
    [279612] = 287849, -- a_blackroot_spider attacks #Risha_Farchaser
    [279611] = 287849, -- a_blackroot_spider attacks #Risha_Farchaser
    [279610] = 287850, -- a_fireclaw_servant attacks #Garrand_Redmist
    [287850] = 279626, -- #Garrand_Redmist attacks a_blackroot_spider
    [287846] = 279624, -- #Filimar_Starshaper attacks a_fireclaw_servant
  },
}

local dataset     = good
local states      = { none = 0, start = 1, wait = 2, attack = 3, fight = 4, done = 5 }
local state       = states.none
local cur_time    = 0 -- current tick time
local last_emote  = 0 -- last emote time
local emote_count = 0
local gave_tooth  = false -- traded Silverclaw the tooth instead of completing mission

local function contains(area, x, y)
  return x >= area.min_x and x <= area.max_x and y >= area.min_y and y <= area.max_y
end

local function get_clients(pred)
  local clients = {}
  for client in eq.get_entity_list():GetClientList().entries do
    if not pred or pred(client:GetX(), client:GetY()) then
      clients[#clients+1] = client
    end
  end
  return clients
end

local function attack_nearest_client(npc)
  local x, y = npc:GetX(), npc:GetY()
  local function dist(client) -- distance squared
    return math.abs(x - client:GetX())^2 + math.abs(y - client:GetY())^2
  end

  local nearest = nil
  for client in eq.get_entity_list():GetClientList().entries do
    if contains(dataset.outer, client:GetX(), client:GetY()) then
      if not nearest or dist(client) < dist(nearest) then
        nearest = client
      end
    end
  end

  if nearest then
    npc:AddToHateList(nearest, 100)
  end
end

local function make_kos(npc)
  -- need to be different factions to avoid aggro issues
  if npc:GetNPCTypeID() == npc_ids.spider then
    npc:SetNPCFactionID(1012) -- KOS_animal_assist
  elseif npc:GetNPCTypeID() == npc_ids.goblin then
    npc:SetNPCFactionID(1321) -- Indifferent-Assist-KOS
  else
    npc:SetNPCFactionID(79) -- KOS_assist
    npc:SaveGuardSpot(0, 0, 0, 0) -- rival npcs run to entrance (0,0,0) if alive after fight
    npc:SetRunning(true)
  end
end

-- one spider/goblin attack clients one tick before the fight
local function attack_clients()
  local entity_list = eq.get_entity_list()
  for _, spawngroup_id in pairs(client_attackers) do
    local npc = entity_list:GetNPCBySpawnID(spawngroup_id)
    if npc.valid then
      attack_nearest_client(npc)
    end
  end
end

-- set rivals and spider/goblins kos and start the fight
local function start_fight(main_rival)
  -- main rival npc starts with nearest client
  make_kos(main_rival)
  attack_nearest_client(main_rival)

  -- make all kos (on separate factions to avoid same types aggroing each other)
  local rivals = {}
  local enemies = {} -- goblins/spiders
  local entity_list = eq.get_entity_list()
  for npc in entity_list:GetNPCList().entries do
    for _, npc_id in pairs(npc_ids) do
      if npc:GetNPCTypeID() == npc_id then
        make_kos(npc)
        if npc_id == npc_ids.spider or npc_id == npc_ids.goblin then
          enemies[#enemies+1] = npc
        else
          rivals[#rivals+1] = npc
        end

        -- attack assigned target
        local target_spawn_id = dataset.spawngroup_targets[npc:GetSp2()]
        if target_spawn_id then
          local target = entity_list:GetNPCBySpawnID(target_spawn_id)
          if target.valid then
            npc:AddToHateList(target, 100)
            target:AddToHateList(npc, 50) -- prevent prox aggro priority
          end
        end

        break
      end
    end
  end

  -- add every enemy and rival to each others hatelists to avoid non-aggro issues
  -- this would probably be better done using npc_aggro and custom factions in db
  for _, enemy in ipairs(enemies) do
    for _, rival in ipairs(rivals) do
      rival:AddToHateList(enemy)
      enemy:AddToHateList(rival)
    end
  end
end

local function do_emote(mt, message)
  eq.zone_emote(mt, message)
  last_emote = cur_time
  emote_count = emote_count + 1
end

local function do_goblin_emote(mt, message)
  -- goblin emotes only occur if the "main" goblin is alive
  local goblin = eq.get_entity_list():GetNPCBySpawnID(main_goblin)
  if goblin.valid then
    do_emote(mt, message)
  end
end

local function rival_spawn(e)
  eq.set_timer("process", 5 * 1000)
end

local function rival_timer(e)
  if e.self:IsEngaged() then
    return
  end

  cur_time = os.time()

  local clients = {}
  if state < states.attack then -- fight starts even if not in proximity
    clients = get_clients(function(x, y)
      -- wait state requires client inside inner area to continue
      local area = state < states.wait and dataset.outer or dataset.inner
      return contains(area, x, y)
    end)
  end

  local elapsed = cur_time - last_emote
  -- eq.debug(("[%s] state: %d clients: %d elapsed: %d"):format(os.date("%X", cur_time), state, #clients, elapsed))

  if state == states.none and #clients > 0 then
    if is_dark_reign then
      do_emote(MT.SayEcho, "Melina Fairwinter shouts, 'Look, others have arrived.  Please help us to defeat these monsters.  This standoff can't go on much longer.'")
    else
      do_emote(MT.SayEcho, "Fahsheer Delure shouts, 'Ah, I see we have company.  Perhaps you can break this standoff?  Aid us against these beasts and I shall see that you are rewarded.'")
    end
    state = states.start
  elseif state == states.start and #clients > 0 and emote_count == 1 and elapsed >= 5 then
    do_emote(MT.SayEcho, "a goblin shouts, 'You no help thief and invader!  Run away now.  Save self.  Master come soon, destroy intruders!'")
  elseif state == states.start and #clients > 0 and emote_count == 2 and elapsed >= 10 then
    if is_dark_reign then
      do_emote(MT.SayEcho, "Melina shouts, 'Please, we need your help.  You can't trust these monsters.  We don't know what they might do.'")
    else
      do_emote(MT.SayEcho, "Fahsheer shouts, 'That decision is up to you, but how you could trust these monsters is unclear to me.'")
    end
  elseif state == states.start and #clients > 0 and emote_count == 3 and elapsed >= 20 then
    if is_dark_reign then
      do_emote(MT.SayEcho, "Filimar shouts at an encroaching spider, 'Get back!  Keep your disgusting hairy feet back!'")
    else
      do_emote(MT.SayEcho, "Gimblemort shouts at an approaching spider, 'Get back!  I'll burn you to ash if you take one more creepy step towards me!'")
    end
  elseif state == states.start and #clients > 0 and emote_count == 4 and elapsed >= 10 then
    if is_dark_reign then
      do_emote(MT.SayEcho, "Melina yells, 'Calm down everyone.  We've kept them back so far.  Surely an opportunity will arise.'")
    else
      do_emote(MT.SayEcho, "Fahsheer yells, 'Calm down everyone.  We've kept them back so far.  Be ready to execute plan B on my word.'")
    end
  elseif state == states.start and #clients > 0 and emote_count == 5 and elapsed >= 10 then
    if is_dark_reign then
      do_goblin_emote(MT.SayEcho, "A goblin yells, 'You opp... Oppo... You not nothing!  You stay 'til master arrives.'")
    else
      do_goblin_emote(MT.SayEcho, "A goblin yells, 'You no B plan!  You stay 'til master arrives.'")
    end
    state = states.wait
  elseif state == states.wait and #clients > 0 and emote_count == 6 and elapsed >= 5 then
    do_goblin_emote(MT.SayEcho, "A goblin shouts, 'Stay away!  You no come near!  All you stay away!'")
  elseif state == states.wait and #clients > 0 and emote_count == 7 and elapsed >= 20 then
    do_goblin_emote(MT.SayEcho, "A goblin panics, 'You die now!  You die now!'")
    state = states.attack
  elseif state == states.attack then
    if is_dark_reign then
      do_emote(MT.SayEcho, "Melina yells, 'Go now while they're distracted! I'll keep the others busy.'")
      do_emote(MT.SayEcho, "'Excellent!', Filimar shouts, 'I shall rid myself of these creatures!'")
    else
      do_emote(MT.SayEcho, "Fahsheer yells, 'Go now while they're distracted! I'll deal with the new folks.'")
      do_emote(MT.SayEcho, "Gimblemort shouts with glee, 'Yes!  Burn you fuzzy-legged freaks!'")
    end
    attack_clients() -- clients attacked by spider/goblin one tick before fight
    state = states.fight
  elseif state == states.fight then
    eq.stop_timer("process")
    start_fight(e.self)
    state = states.done
  end
end

local function silverclaw_spawn(e)
  e.self:SetOOCRegen(0)
  e.self:ModifyNPCStat("hp_regen", "0")
  e.self:SetHP(e.self:GetMaxHP() * 0.5)
end

local function silverclaw_combat(e)
  if not e.joined then
    e.self:SetHP(e.self:GetMaxHP() * 0.5)
  end
end

local function silverclaw_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Silverclaw says, 'Well, these speak before attacking, that's new.  I am wounded, that is certain, but I will fight you to my last breath if I must.  I will live to recover [what has been taken]!'")
  elseif e.message:findi("has been taken") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Silverclaw says, 'Hah!  Why should I trust you?  You two-legged types have been in here killing what remain of my kind for a while.  Why should I tell you anything?  You will just kill me after I've given you the information you seek.  Unless you [promise] me, in a very convincing manner, that you will not harm me, I will not speak to you further except to offer you a warning.  Kill me before I recover what I have lost and I will use my last breath to curse you.'")
  elseif e.message:findi("promise") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Silverclaw says, 'Well, I see that I have little choice but to trust you.  Another group of... miscreants was here a short while ago.  They took something from me and fled.  The only thing that kept me alive was my curse.  I do indeed bear within me an ancient draconic power, one rarely seen these days and even less often in a mere dragon kin such as myself.  It was because of this power and my love of history that earned me the right to bear the Tooth and become its guardian.  I must have it [back].  Luckily those fools became lost during our fight and have attempted to escape in the wrong direction.'")
    e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1)
    e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1)
  elseif e.message:findi("back") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Silverclaw says, 'As you can see, I am in no condition to battle those beasts again.  I shall rest here until they find their way back and then attempt to destroy them.' Silverclaw looks thoughtful for a moment. 'Unless you could recover it for me.  If you do, I will ensure that your passage out of this place is free of danger.  Of course if you do not I shall endeavor to make leaving here as difficult as I can, and I can make that very difficult.  Will you [return the Tooth] to me?'")
  elseif e.message:findi("return the Tooth") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Silverclaw says, 'Good.  This is difficult for me to say, but good luck to you, %s.  I have little left that was not taken by those you now seek, but I shall reward you with what I can upon the return of the great tooth.'"):format(eq.get_race_name(e.other:GetRace())))
  elseif e.message:findi("artifact") and gave_tooth then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Silverclaw says, 'Archanalia was one of the first brood.  He was held in high regard when this land was first hidden away from your kind.  He was a great dragon known for his wisdom and biting sarcasm.  His wit was legendary among our kind, as was his willingness to befriend his lesser kin.  The idea of hiding this place was not one that he liked, for he enjoyed flying high above the world and watching it turn below him.  He enjoyed interacting with two-legs, either by simply frightening them with his magnificence or by changing his form to pass among them.  He knew that hiding the nest would mean seclusion within the mountains for an age or longer and the idea of it made him unhappy. Shall I [continue]?'")
  elseif e.message:findi("continue") and gave_tooth then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Silverclaw says, 'Some others disliked the isolation as well, but their concern was about the loss of power and luxury.  They did not want to surrender the lands to your people.  The elders, however, agreed that the safety of the eggs was more important that any of these other concerns.  It was decided that any wishing to live outside the nest would be sworn under magical oath to never reveal the location and even the purpose of this place.  It fell upon Archanalia to perform this task, for he was trusted by most and had the power to make such magic binding on the minds of dragons. If you wish, I can tell you what happened [next].'")
  elseif e.message:findi("next") and gave_tooth then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Silverclaw says, 'Only the eldest dragons chose to remain behind.  The younger ones wished to retain their place and power in the world.  Some of those younger dragons were unwilling to have their memories altered and Archanalia was required to hunt them down and force their submission to the required magic or, in a very few cases, to destroy the rebel.  When dealing with the last of these rebels, a very clever and powerful dragon despite his youth, Archanalia suffered a terrible festering wound.  He returned to report success and to aid in creating the magic that would keep this place hidden.  He lived many years after that, but his suffering was great.  No one was able to cure his illness, not even Rikkukin.  He died many decades ago.  His body was eaten by the disease that infected him and the only thing untouched was one of his teeth.  You have returned that tooth to me.  As I promised, you shall remain safe while you leave, but you must hurry.  I cannot promise safety here forever.  Thank you and goodbye.'")
  end
end

local function silverclaw_trade(e)
  local item_lib = require("items")
  if item_lib.check_turn_in(e.trade, { item1 = 81903 }) then -- Ancient Tooth of Archanalia
    -- live updates task on turn in but players in zone do not get rewards or completion emote
    -- players out of zone do still get the reward and emote if it completes the task
    -- turning in tooth from a previous mission spawns chest and ends mission but does not give lockout
    eq.zone_emote(MT.Yellow, "You have failed your assigned task.")
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Silverclaw says, 'You have brought it back!  Wonderful!  As I promised, you shall be able to leave this place unhindered.  I also wish to reward you, but I do not know what creatures like you value.  I do have this one small item that was dropped by those that stole the tooth, though.  I also wish you to know about this [artifact] that you have returned to me.'")
    eq.unique_spawn(343001, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), 0) -- a_chest
    e.other:QuestReward(e.self)
    e.other:UpdateTaskActivity(eq.get_dz_task_id(), 3, 1) -- force task completion if on step
    eq.end_dz_task()
    gave_tooth = true
  end
  item_lib.return_items(e.self, e.other, e.trade)
end

local function player_task_complete(e)
  if gave_tooth then
    return 1 -- prevent reward and completion emote (only for members inside dz like live)
  end
end

function event_encounter_load(e)
  is_dark_reign = dark_reign_ids[eq.get_dz_task_id()]
  if is_dark_reign then
    eq.debug("Using Dark Reign zone version")
    dataset = evil
    eq.spawn_condition("thenest", eq.get_zone_instance_id(), spawn_condition.good, 0)
    eq.spawn_condition("thenest", eq.get_zone_instance_id(), spawn_condition.evil, 1)
  else
    eq.debug("Using Norrath's Keepers zone version")
    dataset = good
    eq.spawn_condition("thenest", eq.get_zone_instance_id(), spawn_condition.good, 1)
    eq.spawn_condition("thenest", eq.get_zone_instance_id(), spawn_condition.evil, 0)
  end

  eq.register_npc_event(Event.spawn,  npc_ids.melina,   rival_spawn) -- Dark Reign version
  eq.register_npc_event(Event.timer,  npc_ids.melina,   rival_timer)
  eq.register_npc_event(Event.spawn,  npc_ids.fahsheer, rival_spawn) -- Norrath's Keepers version
  eq.register_npc_event(Event.timer,  npc_ids.fahsheer, rival_timer)
  eq.register_npc_event(Event.spawn,  343565, silverclaw_spawn) -- #Silverclaw
  eq.register_npc_event(Event.combat, 343565, silverclaw_combat)
  eq.register_npc_event(Event.say,    343565, silverclaw_say)
  eq.register_npc_event(Event.trade,  343565, silverclaw_trade)
  eq.register_player_event(Event.task_complete, player_task_complete)
end
