local dz_task_id = 0
local speak = { higglin = 1, apprentice = 2, delve = 3, elder = 4, elite = 5, boss = 6 }
local state = speak.higglin
-- Apprentice_Foreman, Delve_Foreman, Elder_Foreman, Elite_Foreman, Dirtdigger_Boss
local npc_id = { apprentice = 342137, delve = 342134, elder = 342135, elite = 342136, boss = 342138 }

-- attacks other goblins while escorting, on live other npcs do not aggro back to assist the fight
-- nothing happens if escort dies except the mission is bricked (they're also hard to kill on live)
local function aggro_near(goblin)
  -- aggro emote: "%s snarls and moves in to attack."
  -- killing blow emote: %s says, 'I gotz da kill! Look, look! Watch da blood spill!'
  if not goblin:IsEngaged() and goblin:GetEntityVariable("active") then
    local npc_list = eq.get_entity_list():GetNPCList()
    for npc in npc_list.entries do
      if npc:GetNPCFactionID() ~= goblin:GetNPCFactionID() and goblin:CalculateDistance(npc:GetX(), npc:GetY(), npc:GetZ()) < npc:GetAggroRange() then
        goblin:AddToHateList(npc)
      end
    end
  end
end

local function has_arrived_dest(npc, escort_state)
  if state == escort_state then
    local x, y, z = npc:GetWaypointX(), npc:GetWaypointY(), npc:GetWaypointZ()
    return npc:CalculateDistance(x, y, z) < 40
  end
  return false
end

local function respond_wrong_state(npc, required_state)
  if state ~= required_state or npc:GetEntityVariable("active") then
    eq.get_entity_list():MessageClose(npc, true, 100, MT.SayEcho, ("%s says, 'I don't trusts you! Get out of here before they see me talking to you!'"):format(npc:GetCleanName()))
    return true
  end
  return false
end

local function higglin_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Higglin Diggerchop says, 'It's about time one of you showed up. I've been waiting for hours! Hours! Now, listen, listen!... okay, listen!  I gots to go see me boss and then he will takes you to someone who will talks maybe. See? See? That's how it works. They says I'm a traitor, so this isn't gonna be easy, easy.  Now do whatever yous gots to do and let me know when you are [ready] to move!  I know the way. The way!'")
  elseif e.message:findi("ready") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Higglin Diggerchop says, 'Okay, now stay close. If I get hurt it's all over for you and I'm not gonna wait!'")
    if not e.self:GetEntityVariable("active") then
      eq.unique_spawn(npc_id.apprentice, 0, 0, -290.0, 616.0, 4.0, 130.0) -- Apprentice_Foreman
      e.self:SetEntityVariable("active", tostring(speak.higglin))
      e.other:UpdateTaskActivity(dz_task_id, speak.higglin, 1)
      e.self:MoveTo(-268.25, 620.25, 2.5, 388.0, true) -- todo: grid
    end
  end
end

local function higglin_tick(e)
  aggro_near(e.self)
  if has_arrived_dest(e.self, speak.higglin) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Higglin Diggerchop says, 'Foreman! Here they are! They waits for you to tell them about who was digging through to dragon lands. You tell them. Tell them! I'm leaving before more come to kill!'")
    state = speak.apprentice
  end
end

local function apprentice_say(e)
  if e.message:findi("hail") and not respond_wrong_state(e.self, speak.apprentice) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Apprentice Foreman says, 'How I got dragged into this?! Dirtdiggers not like me for talking to you. Tell me when to [move] and we'll try to make our way to my boss.  I'm gonna pretend I don't know ya though.  You understand?'")
  elseif e.message:findi("move") and not respond_wrong_state(e.self, speak.apprentice) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Apprentice Foreman says, 'Let's go then!'")
    eq.unique_spawn(npc_id.delve, 0, 0, -601.0, 838.0, 4.0, 250.0) -- Delve_Foreman
    e.self:SetEntityVariable("active", tostring(speak.apprentice))
    e.other:UpdateTaskActivity(dz_task_id, speak.apprentice, 1)
    e.self:MoveTo(-600.625, 825.125, 2.5, 3.25, true) -- todo: grid
  end
end

local function apprentice_tick(e)
  aggro_near(e.self)
  if has_arrived_dest(e.self, speak.apprentice) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Apprentice Foreman says, 'Hail, boss. Here's them meddlers from the outer lands. They want to know what you know.  I don't want any part of it. Higglin said it was okay.  It was Higglin.  Must go... now.'")
    state = speak.delve
  end
end

local function delve_say(e)
  if e.message:findi("hail") and not respond_wrong_state(e.self, speak.delve) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Delve Foreman says, 'You all smell as foul as my lord Tirranun's breath.  Whew!  And now that you've even shown up to speak to me, you've put my life in danger -- and for a goblin as fiery as I, things are gonna get heated! Tell me when you're ready to take the [plunge]!'")
  elseif e.message:findi("plunge") and not respond_wrong_state(e.self, speak.delve) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Delve Foreman says, 'We're off to see the foreman!'")
    eq.unique_spawn(npc_id.elder, 0, 0, -580.0, 1194.0, 4.0, 134.0) -- Elder_Foreman
    e.self:SetEntityVariable("active", tostring(speak.delve))
    e.other:UpdateTaskActivity(dz_task_id, speak.delve, 1)
    e.self:MoveTo(-554.625, 1172.625, 2.5, 48.75, true) -- todo: grid
  end
end

local function delve_tick(e)
  aggro_near(e.self)
  if has_arrived_dest(e.self, speak.delve) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Delve Foreman says, 'That was rather unpleasant, I must say. I suppose if I'm going to play with fire, then sometimes I'm gonna get burned... Did you get it? Rather funny... yes.  See, I'm a goblin of fire... and I'm in a volcano... and... oh, never mind.  Dolts!   All of you!  I'm off!'")
    state = speak.elder
  end
end


local function elder_say(e)
  if e.message:findi("hail") and not respond_wrong_state(e.self, speak.elder) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Elder Foreman says, 'You are incapable of good humor, fool! You are as bright as a foul ghoul. But I've got bigger ideas and brains than you.  I know I do!  So... stop wasting my rhyme and tell me when it's [time]!'")
  elseif e.message:findi("time") and not respond_wrong_state(e.self, speak.elder) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Elder Foreman says, 'So now we're off to see my boss and if I'm hurt it will be your loss!'")
    eq.unique_spawn(npc_id.elite, 0, 0, -385.0, 1556.0, 4.0, 14.0) -- Elite_Foreman
    e.self:SetEntityVariable("active", tostring(speak.elder))
    e.other:UpdateTaskActivity(dz_task_id, speak.elder, 1)
    e.self:MoveTo(-380.25, 1578.375, -2.375, 382.25, true) -- todo: grid
  end
end

local function elder_tick(e)
  aggro_near(e.self)
  if has_arrived_dest(e.self, speak.elder) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Elder Foreman says, 'Look what I have brought! These dunces cannot be taught.  They will never understand our game down here in the lava and flame. Higglin said it would be alright to lead them to you this very night. And now I must take my leave as with their smell it's hard to breathe.'")
    state = speak.boss
  end
end

local function elite_say(e)
  if e.message:findi("hail") and not respond_wrong_state(e.self, speak.boss) then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Elite Foreman says, 'Oh stop with the flippin' rhymes. How tiring and annoying are you?! Well, now that you all are here, I can point you to the only one that can give you answers.  He's the boss of all bosses around here and he knows all.  He's not fond of visitors, you see.  Watch your language, and your step.  He's right over there.'")
    e.other:UpdateTaskActivity(dz_task_id, speak.elite, 1)
    eq.unique_spawn(npc_id.boss, 0, 0, -142.0, 2004.0, -4.0, 255.0) -- Dirtdigger_Boss
  end
end

local function boss_say(e)
  -- live note: random low faction "lump of refuse" on hail, need to sneak from behind to see dialogue
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Dirtdigger Boss says, 'Ha ha! Your efforts have served only to bring to light the betrayers in our midst.  I will tell you nothing save the dark figure in the mines hid his face from all and now yours will be hidden for all time in these rivers of molten rock!'")
    e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0)
    e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0)
    e.self:AddToHateList(e.other)
  end
end

function event_encounter_load(e)
  dz_task_id = eq.get_dz_task_id()
  eq.register_npc_event(Event.say,  342133, higglin_say) -- Higglin_Diggerchop
  eq.register_npc_event(Event.tick, 342133, higglin_tick)
  eq.register_npc_event(Event.say,  npc_id.apprentice, apprentice_say)
  eq.register_npc_event(Event.tick, npc_id.apprentice, apprentice_tick)
  eq.register_npc_event(Event.say,  npc_id.delve, delve_say)
  eq.register_npc_event(Event.tick, npc_id.delve, delve_tick)
  eq.register_npc_event(Event.say,  npc_id.elder, elder_say)
  eq.register_npc_event(Event.tick, npc_id.elder, elder_tick)
  eq.register_npc_event(Event.say,  npc_id.elite, elite_say)
  eq.register_npc_event(Event.say,  npc_id.boss,  boss_say)
end
