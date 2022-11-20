local dark_reign_task_ids = { [4897] = true, [4898] = true } -- Web of Lies (Dark Reign versions)
local start   = { min_x = 370, max_x = 705, min_y = -3000, max_y = -2770 } -- script start area
local check   = { min_x = 500, max_x = 595, min_y = -3000, max_y = -2898 } -- weapon check area
local signal  = { respond_fools = 1, respond_future = 2, respond_silence = 3, kos = 4 }
local state   = { none = 0, start = 1, wait = 2, negotiate = 3, kill = 4, done = 5 }
local warn    = { none = 0, decide = 1, impatient = 2, cooperate = 3, leave = 4 }
local npc_ids = {
  shala      = 343665, -- #Shala_Belen (Norrath's Keepers version)
  nera       = 343716, -- #Nera_Goodlocks (Dark Reign version)
  keentooth  = 343664, -- #Keentooth,_Tribal_Elder
  flameguard = 343663, -- Flameguard
}

local is_dark_reign = false -- flag dark reign version for different dialogue
local enemy_id      = npc_ids.shala -- #Shala_Belen or #Nera_Goodlocks depending on version
local cur_state     = state.none
local warn_state    = warn.none
local total_secs    = 0 -- total seconds not in check weapon proximity for warnings
local last_warn     = 0 -- last warning seconds

local function get_clients()
  local in_start_area = false
  local in_check_area = false

  local clients = {}
  local client_list = eq.get_entity_list():GetClientList()
  for client in client_list.entries do
    clients[#clients+1] = client

    local x, y = client:GetX(), client:GetY()
    if x >= start.min_x and x <= start.max_x and y >= start.min_y and y <= start.max_y then
      in_start_area = true -- client in area to trigger script start
      if x >= check.min_x and x <= check.max_x and y >= check.min_y and y <= check.max_y then
        in_check_area = true -- client in range to trigger weapon/aggro check
      end
    end
  end

  return clients, in_start_area, in_check_area
end

-- return true if any clients have an item in primary or secondary slot
local function check_weapons(clients)
  for _, client in ipairs(clients) do
    local inv = client:GetInventory()
    if inv:GetItem(Slot.Primary).valid or inv:GetItem(Slot.Secondary).valid then
      return true
    end
  end
  return false
end

-- move guards to south room destination based on spawn group locations (guards pair up at 3 locations)
local function move_guards()
  local messaged = false
  local npc_list = eq.get_entity_list():GetNPCList()
  for guard in npc_list.entries do
    if guard.valid and guard:GetNPCTypeID() == npc_ids.flameguard then
      if not messaged then
        eq.get_entity_list():MessageClose(guard, true, 100, MT.SayEcho, "The Flameguard looks concerned. 'As you wish, elder. Yours is the wisdom, ours is the strength.'")
        messaged = true
      end

      local spawngroup = guard:GetSp2()
      if spawngroup == 280015 or spawngroup == 280018 then -- east guards
        guard:MoveTo(636.75, -3445.0, -357.0, 261.75, true)
      elseif spawngroup == 280014 or spawngroup == 280017 then -- western guards
        guard:MoveTo(631.125, -3510.375, -355.0, 265.5, true)
      elseif spawngroup == 280020 or spawngroup == 280021 then -- north guards
        guard:MoveTo(615.875, -3558.75, -353.625, 282.5, true)
      end
    end
  end
end

local function shala_spawn(e)
  -- if this is a Dark Reign mission version replace #Shala_Belen with #Nera_Goodlocks
  if dark_reign_task_ids[eq.get_dz_task_id()] then
    eq.depop()
    eq.unique_spawn(npc_ids.nera, 0, 0, 557.0, -2926.0, -356.75, 260.0) -- #Nera_Goodlocks
    enemy_id = npc_ids.nera
    is_dark_reign = true
  end
end

local function shala_signal(e)
  if e.signal == signal.respond_fools then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Shala Belen says, 'Bloody fools!  I will not have you ruin our chance at peace!'")
  elseif e.signal == signal.respond_future then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Shala Belen says, 'Don't listen to them, they will lie to you!'")
    signal_npc(npc_ids.keentooth, signal.respond_silence)
  elseif e.signal == signal.kos then
    e.self:SetNPCFactionID(79) -- KOS_assist
  end
end

local function nera_signal(e)
  if e.signal == signal.respond_fools then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Nera Goodlocks says, 'Bloody fools!  I will not have you ruin our chance at peace!'")
  elseif e.signal == signal.respond_future then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Nera Goodlocks says, 'There must be something that can be done to stop this!'")
    signal_npc(npc_ids.keentooth, signal.respond_silence)
  elseif e.signal == signal.kos then
    e.self:SetNPCFactionID(79) -- KOS_assist
  end
end

local function keentooth_signal(e)
  if e.signal == signal.respond_silence then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Keentooth, Tribal Elder says, 'Silence!  I have heard enough from you.  I wish to speak to these creatures.  You have come here and killed a number of my people.  Why are you here?  Do you seek [treasure]?  Are you here just to [kill] my kind, or is there some [other reason]?  I would know why you are here before I continue to entertain the idea of speaking with my masters of peace with the bringers of shadow and death to our home.'")
  end
end

local function flameguard_signal(e)
  if e.signal == signal.kos then
    e.self:SetNPCFactionID(79) -- KOS_assist
  end
end

-- issue commands to npcs (real signals have annoying delay for dialogue)
function signal_npc(target_id, cmd)
  local npc = eq.get_entity_list():GetNPCByNPCTypeID(target_id)
  if npc.valid and target_id == npc_ids.shala then
    shala_signal({ self = npc, signal = cmd })
  elseif npc.valid and target_id == npc_ids.nera then
    nera_signal({ self = npc, signal = cmd })
  elseif npc.valid and target_id == npc_ids.keentooth then
    keentooth_signal({ self = npc, signal = cmd })
  end
end

local function keentooth_spawn(e)
  eq.set_timer("process", 5 * 1000)
end

local function keentooth_timer(e)
  if e.self:IsEngaged() then
    return
  end

  local clients, in_start_area, in_check_area = get_clients()

  -- message logic mimics live which is based on ticks outside proximity not real time
  -- warnings occur every 1m5s if not paused (next tick after 1min which was likely intent)
  local warn_elapsed = (total_secs - last_warn) >= 60 -- last warning over 1 minute ago (via ticks)

  if cur_state == state.none and in_start_area then
    eq.zone_emote(MT.SayEcho, "Nera leans forward and speaks to the ancient goblin in a voice too quiet for you to understand her words.")
    cur_state = state.start
  elseif cur_state == state.start then -- occurs on next tick after script start
    eq.zone_emote(MT.SayEcho, "Keentooth shouts, 'Halt!  You have invaded our lands and killed our people.  This one here claims that this conflict is a misunderstanding and that peace is possible between your people and the great dragons of this land.  I do not believe what she has to say.  I do not believe that your people will be able to come forward in peace, nor do I believe that the rage you have caused our masters will ever be soothed.  Prove to me that you can come forward in peace.  Put away your weapons and all of you come forward with your hands empty and stand between my guards or leave.  Those are your choices if you wish to live.")
    cur_state = state.wait
  elseif cur_state >= state.wait and cur_state ~= state.kill and in_check_area then
    -- any client in zone with items in primary or secondary slots sets kos (permanent)
    -- warning tick increments are paused while a client is inside check weapons range
    if check_weapons(clients) then
      -- does not change state (live still warns if aggro dropped and left check area)
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Keentooth, Tribal Elder says, 'I knew you could not be trusted!  Kill the invaders!'")
      signal_npc(enemy_id, signal.respond_fools)
      signal_npc(enemy_id, signal.kos)
      eq.signal(npc_ids.flameguard, signal.kos)
      e.self:SetNPCFactionID(79) -- KOS_assist
    elseif cur_state == state.wait then
      -- can still trigger this if previously had weapons, but responses don't work since kos
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Keentooth looks at each of you with a nod of approval. 'Perhaps this creature was telling the truth.  It might be possible that this battle can end before all of my people are killed.  I have no doubt that the great dragons will cause untold damage to you and your people as well and this is most certainly this female's motivation for coming here.  We serve our masters to our fullest, but we do not wish to die, nor do we wish any further destruction to our masters or their unborn. Let us discuss your [future].")
      cur_state = state.negotiate -- stops warnings
    end
  elseif cur_state == state.wait and warn_state == warn.none and warn_elapsed then
    eq.zone_emote(MT.SayEcho, "Keentooth shouts, 'Come now, make your decision.  Join us in talk or fight, but don't just stand around.  If you wait long enough one of our masters will come along and decide this for us.'")
    warn_state = warn.decide
    last_warn = total_secs
  elseif cur_state == state.wait and warn_state == warn.decide and warn_elapsed then
    eq.zone_emote(MT.SayEcho, "Keentooth shouts, 'My patience grows short!  I must have all of the invaders here before me showing empty hands or I will order you destroyed.  Indecision is one of the greatest weaknesses.'")
    warn_state = warn.impatient
    last_warn = total_secs
  elseif cur_state == state.wait and warn_state == warn.impatient and warn_elapsed then
    eq.zone_emote(MT.SayEcho, "Keentooth shouts, 'This is the last time I will ask for your cooperation.  Come before me open-handed or you shall be considered enemies.'")
    warn_state = warn.cooperate
    last_warn = total_secs
  elseif cur_state == state.wait and warn_state == warn.cooperate and warn_elapsed then -- can still trigger negotiation in this state despite text
    eq.zone_emote(MT.SayEcho, "Keentooth shouts in frustration, 'That is your decision then.  Leave immediately!'")
    warn_state = warn.leave
    last_warn = total_secs
  elseif (cur_state == state.wait and warn_state == warn.leave and warn_elapsed) or cur_state == state.kill then
    eq.zone_emote(MT.SayEcho, "Keentooth shouts in anger, 'Kill any of the invaders that you see.  I will consider the words of this Halfling creature in light of what has happened.'")
    signal_npc(enemy_id, signal.kos)
    eq.signal(npc_ids.flameguard, signal.kos)
    e.self:SetNPCFactionID(79) -- KOS_assist
    cur_state = state.done
  elseif cur_state == state.wait then
    total_secs = total_secs + 5 -- only incremented when outside check area
  end
end

local function keentooth_say(e)
  if cur_state ~= state.negotiate or e.self:GetNPCFactionID() == 79 then -- ignored if set to KOS_assist
    return
  end

  if e.message:findi("future") then
    if is_dark_reign then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Keentooth, Tribal Elder says, 'This halfling has come to me to ask that I speak to my masters on your behalf.  She tells me that there has been a misunderstanding and that most of you are not responsible for the ruin that has been made of our paradise.  I counter with the fact that we do not care who is responsible, we simply wish our revenge for what has happened.  It is certain that our masters will exact that revenge regardless of any words or actions on your part.'")
    else
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Keentooth, Tribal Elder says, 'This elf has come to me to ask that I speak to my masters in regard to some sort of bargain.  She tells me that you are of a people that might wish to end our conflict; that you would claim to not be responsible for it.  I counter with the fact that we do not care who is responsible, we simply wish our revenge for what has happened.  It is certain that our masters will exact that revenge regardless of any words or actions on your part.'")
    end
    signal_npc(enemy_id, signal.respond_future)
  elseif e.message:findi("treasure") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Keentooth, Tribal Elder says, 'That does not surprise me at all.  This is what the masters have told us was your desire.  Leave here immediately and you may yet live.'")
    cur_state = state.kill
  elseif e.message:findi("kill") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Keentooth, Tribal Elder says, 'Such arrogance!  I shall kill you myself!'")
    cur_state = state.kill
  elseif e.message:findi("other(.*)reason") then
    move_guards()
    if is_dark_reign then
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Keentooth, Tribal Elder says, 'What reason could bring you here other than murder or loot?  Are you compatriots of the Halfling?  That seems unlikely, for she was told that she was the only one allowed to come here.' The aged goblin cocks his head in thought, then says, 'Let us test the truth of what the Halfling has said.  If those invading our home are in the minority, then surely it is most likely that you are not invaders but have come here with other, loftier goals.  If that is true, then you should be willing to [surrender] to me.  If you do, I shall send you out of this place in safety.  If you [choose not] to surrender, leave here, for I have no use for you.  You may answer freely.'  The emaciated goblin waves a craggy arm at his guards.'")
    else
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Keentooth, Tribal Elder says, 'What reason could bring you here other than murder or loot?  Are you compatriots of this Elf?  That seems unlikely, for she was told that she was the only one allowed to come here.' The aged goblin cocks his head in thought, then says, 'Let us test the truth of what she has said.  If those invading our home are in the minority, then surely it is most likely that you are not invaders but have come here with other, loftier goals.  If that is true, then you should be willing to [surrender] to me.  If you do, I shall send you out of this place in safety.  If you [choose not] to surrender, leave here, for I have no use for you.  You may answer freely.'  The emaciated goblin waves a craggy arm at his guards.'")
    end
  elseif e.message:findi("surrender") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Keentooth, Tribal Elder says, 'You surprise me.  You did not seem the type to surrender to anyone, nor to leave potential treasure unclaimed.  You have convinced me of nothing.  This could, of course, have just been an elaborate plan to sway me, but I shall consider your actions.  Leave here and do not return.'")
  elseif e.message:findi("choose(.*) not") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Keentooth, Tribal Elder says, 'You have proven what I already suspected.  Get out of our home now.'")
  end
end

local function enemy_combat(e)
  -- Shala/Nera and Keentooth assist each other if attacked before made kos
  if e.joined then
    local assist_id = 0
    if e.self:GetNPCTypeID() == npc_ids.keentooth then
      assist_id = enemy_id
    else
      assist_id = npc_ids.keentooth
    end

    local npc = eq.get_entity_list():GetNPCByNPCTypeID(assist_id)
    if npc.valid then
      npc:AddToHateList(e.self:GetHateRandom())
    end
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.spawn,  npc_ids.shala,      shala_spawn)
  eq.register_npc_event(Event.combat, npc_ids.shala,      enemy_combat)
  eq.register_npc_event(Event.combat, npc_ids.nera,       enemy_combat)
  eq.register_npc_event(Event.signal, npc_ids.flameguard, flameguard_signal)
  eq.register_npc_event(Event.spawn,  npc_ids.keentooth,  keentooth_spawn)
  eq.register_npc_event(Event.timer,  npc_ids.keentooth,  keentooth_timer)
  eq.register_npc_event(Event.say,    npc_ids.keentooth,  keentooth_say)
  eq.register_npc_event(Event.combat, npc_ids.keentooth,  enemy_combat)
end
