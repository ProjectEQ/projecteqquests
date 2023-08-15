-- it's possible to retry `animals`, `steel/silk`, and `sensei` on live due to a bug
--
-- if the `elements` or `emotions` phase was failed and then completed on a retry
-- attempt, the later phases will not end the dz on failure and instead reset state
-- normally these later phases disallow retries and end the dz on failure
--
-- since live will not respawn a wave more than once, failing the `animals` phase twice
-- results in the npcs depopping but not respawning (allowing it to be bypassed)
-- `silk/steel` and `sensei` do not depop but can be infinitely attempted due to this bug
local enable_live_bug = true

-- todo: possible mechanics that need implemented
-- Grandmaster Beetle hunches into a tight ball and become invulnerable to attacks.
-- Grandmaster Beetle uncurls and attacks.

-- npc ids for zone version 10 (Stormreach Challenge)
-- todo: grids (current grids for elements are also not live accurate)
local waves = {
  elements = {
    fire    = { id = 340630, spawn2 = 256786, grid = 15 }, -- #Disciple_of_Fire
    earth   = { id = 340629, spawn2 = 256785, grid = 16 }, -- #Disciple_of_Earth
    water   = { id = 340628, spawn2 = 256784, grid = 14 }, -- #Disciple_of_Water
    wood    = { id = 340627, spawn2 = 256783, grid = 13 }, -- #Disciple_of_Wood
    metal   = { id = 340626, spawn2 = 256782, grid = 12 }, -- #Disciple_of_Metal
  },
  emotions = {
    rage    = { id = 340625, spawn2 = 256781, dst = { x = -114.875, y = -324.0,   z = 248.75, h = 0.0 } }, -- #Master_of_Rage
    deceit  = { id = 340624, spawn2 = 256780, dst = { x = -101.0,   y = -324.0,   z = 248.75, h = 0.0 } }, -- #Master_of_Deceit
    doubt   = { id = 340623, spawn2 = 256779, dst = { x = -85.0,    y = -323.875, z = 248.75, h = 0.0 } }, -- #Master_of_Doubt
    content = { id = 340622, spawn2 = 256778, dst = { x = -70.875,  y = -323.875, z = 248.75, h = 0.0 } }, -- #Master_of_Contentment
  },
  animals = {
    puma    = { id = 340621, spawn2 = 256777, dst = { x = -114.875, y = -324.0,   z = 248.75, h = 0.0 } }, -- #Grandmaster_Puma
    snake   = { id = 340620, spawn2 = 256776, dst = { x = -92.875,  y = -323.875, z = 248.75, h = 0.0 } }, -- #Grandmaster_Snake
    beetle  = { id = 340619, spawn2 = 256775, dst = { x = -70.875,  y = -323.875, z = 249.25, h = 0.0 } }, -- #Grandmaster_Beetle
  },
  steelsilk = {
    steel   = { id = 340618, spawn2 = 256774, dst = { x = -115.0,   y = -323.875, z = 249.25, h = 0.0 } }, -- #Steel
    silk    = { id = 340617, spawn2 = 256773, dst = { x = -70.875,  y = -324.0,   z = 248.75, h = 0.0 } }, -- #Silk
  },
}

local states = {
  none      = 0,
  start     = { move = 10, wait    = 11, begin  = 12 },
  elements  = { move = 20, chat    = 21, reply  = 22, aggro = 23, fight = 24 },
  emotions  = { move = 30, rage    = 31, deceit = 32, doubt = 33, content = 34, aggro = 35, fight = 36 },
  animals   = { move = 40, aggro   = 41, fight  = 42 },
  steelsilk = { move = 50, steel   = 51, silk   = 52, aggro = 53, fight = 54 },
  sensai    = { beat = 60, success = 61, move   = 62, aggro = 63, fight = 64 },
  retry     = 70,
  failed    = 80,
  done      = 90,
}

local start_area = { min_x = -121, max_x = -65, min_y = -142, max_y = -40 }
local dojo_area  = { min_x = -207, max_x = 18,  min_y = -344, max_y = -146 }
local sensai_loc = { x = -92.875, y = -332.875, z = 253.5, h = 1.25 }

local state      = states.none
local next_wait  = 0  -- next state transition time
local attempt    = 0  -- elements and emotions waves allow a second attempt
local respawned  = {} -- waves that have been respawned (live only respawns once)

local function get_clients(area, gm_bypass)
  local clients = {}
  local has_gm = false
  for client in eq.get_entity_list():GetClientList().entries do
    local x, y = client:GetX(), client:GetY()
    if client.valid and x >= area.min_x and x <= area.max_x and y >= area.min_y and y <= area.max_y then
      clients[#clients+1] = client
      if client:GetGM() then
        if gm_bypass and not has_gm then
          eq.debug(("Client %s with GM flag is in area, bypassing client count requirement"):format(client:GetName()))
        end
        has_gm = true
      end
    end
  end
  return clients, has_gm
end

local function is_wave_dead(wave_npcs)
  for npc in eq.get_entity_list():GetNPCList().entries do
    for _, wave_npc in pairs(wave_npcs) do
      if npc.valid and not npc:IsCorpse() and npc:GetNPCTypeID() == wave_npc.id then
        return false
      end
    end
  end
  return true
end

local function move_npcs(wave_npcs)
  eq.debug("moving npc wave")
  for _, wave_npc in pairs(wave_npcs) do
    local npc = eq.get_entity_list():GetNPCByNPCTypeID(wave_npc.id)
    if npc.valid and wave_npc.grid then
      npc:AssignWaypoints(wave_npc.grid)
    elseif npc.valid and wave_npc.dst then
      npc:MoveTo(wave_npc.dst.x, wave_npc.dst.y, wave_npc.dst.z, wave_npc.dst.h, true)
    end
  end
end

local function make_aggro(npc)
  npc:CastToNPC():SetSpecialAbility(SpecialAbility.immune_melee, 0)
  npc:CastToNPC():SetSpecialAbility(SpecialAbility.immune_magic, 0)
  npc:CastToNPC():SetSpecialAbility(SpecialAbility.immune_aggro, 0)
  npc:CastToNPC():SetSpecialAbility(SpecialAbility.immune_aggro_on, 0)
  npc:CastToNPC():SetSpecialAbility(SpecialAbility.no_harm_from_client, 0)
  npc:CastToNPC():ModifyNPCStat("aggro", "200")
end

local function make_wave_aggro(wave_npcs)
  eq.debug("enabling wave aggro")
  for _, wave_npc in pairs(wave_npcs) do
    local npc = eq.get_entity_list():GetNPCByNPCTypeID(wave_npc.id)
    if npc.valid then
      make_aggro(npc)
      eq.set_timer("tick", 5 * 1000, npc)
    end
  end
end

local function say_emote(npc, animate, msg)
  eq.zone_emote(MT.SayEcho, msg)
  if animate then
    npc:DoAnim(111, 7) -- hand to ear animation (only occurs with some npc emotes)
  end
end

local function signal_emote(wave_npc, animate, msg)
  local npc = eq.get_entity_list():GetNPCByNPCTypeID(wave_npc.id)
  if npc.valid then
    say_emote(npc, animate, msg)
  end
end

local function do_dojo_leash_check(npc, return_loc)
  local x, y = npc:GetX(), npc:GetY()
  if x < dojo_area.min_x or x > dojo_area.max_x or y < dojo_area.min_y or y > dojo_area.max_y then
    npc:CastSpell(3230, npc:GetID()) -- Spell: Balance of the Nameless
    npc:SpellFinished(3230, npc) -- double casts
    if not return_loc then
      npc:GotoBind()
    else
      npc:GMMove(return_loc.x, return_loc.y, return_loc.z, return_loc.h)
    end
    npc:WipeHateList()
  end
end

-- depop and respawn a wave
local function reset_wave(wave_npcs, depop)
  eq.debug("resetting wave, depopping: " .. tostring(depop))
  if depop then
    for _, wave_npc in pairs(wave_npcs) do
      eq.depop_all(wave_npc.id)
    end
  end

  -- live only respawns a wave once (seen via the retry bug)
  if not respawned[wave_npcs] then
    for _, wave_npc in pairs(wave_npcs) do
      if depop or not eq.get_entity_list():IsMobSpawnedByNpcTypeID(wave_npc.id) then
        eq.spawn_from_spawn2(wave_npc.spawn2)
      end
    end
    respawned[wave_npcs] = true
  end
end

-- sets new state for a wave failure
local function do_fail(allow_retry)
  if allow_retry then
    if attempt == 0 then
      state = states.retry
      attempt = attempt + 1
    else
      state = states.failed
    end
  elseif attempt == 0 or not enable_live_bug then
    state = states.failed
  else -- live bug, if attempt > 0 and not allow_retry (animals/steelsilk/sensai) state is reset
    eq.debug("resetting state due to live bug")
    state = states.start.move
  end
end

local function sensei_spawn(e)
  eq.set_timer("tick", 5 * 1000)
end

local function sensei_timer(e)
  -- eq.debug(("[%s] state: %s next_wait time: %s"):format(os.date(), tostring(state), os.date("%X", next_wait)))
  local now = os.time()
  local wait_finished = now >= next_wait

  if state == states.none and #get_clients(start_area) > 0 then
    say_emote(e.self, true, "Storm Reach Sensei says, 'Welcome to the Storm Reach Dojo.  I am pleased that you have taken up our humble challenge.  As soon as you are ready, bring at least six of your fellows into the dojo and we shall begin.  Be aware that this is a contest to the death.  Do not enter the dojo unless you are prepared to pay that price.'")
    state = states.start.move
  elseif state == states.start.move then
    e.self:MoveTo(sensai_loc.x, sensai_loc.y, sensai_loc.z, sensai_loc.h, true)
    state = states.start.wait
  elseif state == states.start.wait then
    local clients, has_gm = get_clients(dojo_area, true)
    if #clients >= 6 or has_gm then
      say_emote(e.self, true, "The Storm Reach Sensei says, 'Good, you have decided to meet the challenge.  I will not bore you with unworthy tales of our training methods or our meager accomplishments, certainly your own deeds far outshine our own.  We are but meager servants to the Strom Mistress, Yar`Lir, and are of little consequence.  We have been asked to test you and, certainly, ourselves in a battle to the death.  The residents of this place are away at tasks beyond those such as we, and for a short while we have this room to ourselves.  We must finish our contest before they return, and so there is little time for pleasantries.'")
      state = states.start.begin
    end
  elseif state == states.start.begin then
    say_emote(e.self, true, "The Storm Reach Sensei says, 'A winner will be declared if they are the only combatants alive in this room.  Your first challenge will be to defeat the Disciples of The Five Elements.  Certainly they will be easily defeated by such mighty beings, but it is within their hearts to try.  Your battle will begin in one minute.  Prepare yourselves.'")
    e.self:SetAppearance(Appearance.Sitting) -- live will sit while still moving
    state = states.elements.move
  elseif state == states.elements.move then
    move_npcs(waves.elements)
    state = states.elements.chat
    next_wait = now + 25
  elseif state == states.elements.chat and wait_finished then
    signal_emote(waves.elements.metal, true, "In a clear, ringing voice, The Disciple of Metal says, 'Please forgive my poor humor, but I am very eager to test your mettle.'")
    signal_emote(waves.elements.earth, true, "The Disciple of Earth rumbles, 'When we have defeated you, I shall see that your corpses rot in the soil as is proper.'")
    signal_emote(waves.elements.fire,  true, "The Disciple of Fire shouts, 'I make no apologies.  I shall burn your hearts out!'")
    state = states.elements.reply
  elseif state == states.elements.reply then
    signal_emote(waves.elements.water, true, "The Disciple of Water says, 'Ah, yes.  You must forgive Fire, for he cares little for pleasantries.  It is part of his charm.  You most certainly will be worthy opponents.  I am honored to face you.'")
    signal_emote(waves.elements.wood,  true, "The Disciple of Wood says, 'May our efforts here earn favor with those that watch over us all.'")
    state = states.elements.aggro
    next_wait = now + 20
  elseif state == states.elements.aggro and wait_finished then
    make_wave_aggro(waves.elements)
    state = states.elements.fight
  elseif state == states.elements.fight then
    local clients = get_clients(dojo_area)
    local wave_dead = is_wave_dead(waves.elements)
    if wave_dead and #clients > 0 then -- live pauses during wave fights if wave dead but no clients in dojo
      say_emote(e.self, true, "The Storm Reach Sensei says, 'Congratulations!  You have defeated the Disciples of the Five Elements.  You have proven yourself worthy to face the Four Emotions.  They have mastered their emotions and from them they gain strength.  Each has become a conduit for the emotions of our kind, a paradigm, if you will.  Certainly you shall defeat them, for you are the champions of your people and they are slaves.  We shall begin again in two minutes.  Rest and consult with each other, if you have need.'")
      e.self:SetAppearance(Appearance.Sitting) -- if was still moving during start dialogue
      state = states.emotions.move
    elseif not wave_dead and #clients == 0 then
      say_emote(e.self, true, "The Storm Reach Sensei says, 'I share your concern over your loss.  Your failure shames me, for we have obviously taken advantage of you in some fashion.  The glory from our victory is lessened by this shame.  If we are lucky our mistress will smile upon the Storm Reach Dojo and the Elementals.  Perhaps she will be in a kindly mood and will not fault us for the weaknesses of our opponents.'")
      reset_wave(waves.elements, true)
      do_fail(true)
    end
  elseif state == states.emotions.move then
    move_npcs(waves.emotions)
    state = states.emotions.rage
    next_wait = now + eq.seconds("1m10s") -- emotes start 1m15s after message
  elseif state == states.emotions.rage and wait_finished then
    signal_emote(waves.emotions.rage, true, "The Master of Rage shouts, 'I hate you!  I will rend you into bite-sized chunks of flesh and feed them to the puma!' Rage's face darkens with blood and flecks of spittle fly from his mouth as he pants and stares at his enemies.")
    state = states.emotions.deceit
  elseif state == states.emotions.deceit then
    signal_emote(waves.emotions.deceit, true, "The Master of Deceit smiles broadly. 'You certainly will find Rage difficult to stop.  I see it boiling up inside many of you. Allow it to take over, and Rage will ruin you.'")
    state = states.emotions.doubt
  elseif state == states.emotions.doubt then
    signal_emote(waves.emotions.doubt, true, "The Master of Doubt mutters, 'I...  You...' he sighs, 'I do not know what will happen next.  I see the same misgiving in some of you.  Could it be that you are like me?  No, that seems unlikely.'")
    state = states.emotions.content
  elseif state == states.emotions.content then
    signal_emote(waves.emotions.content, true, "The Master of Contentment drawls, 'Ah!  I am pleased to meet you all.  This is a fine challenge for us, is it not?  I find this sort of exercise invigorating, though rarely do I find invigoration to be a good thing.'")
    state = states.emotions.aggro
    next_wait = now + 10
  elseif state == states.emotions.aggro and wait_finished then
    make_wave_aggro(waves.emotions)
    state = states.emotions.fight
  elseif state == states.emotions.fight then
    local clients = get_clients(dojo_area)
    local wave_dead = is_wave_dead(waves.emotions)
    if wave_dead and #clients > 0 then
      eq.zone_emote(MT.SayEcho, "The Storm Reach Sensei says, 'Well Done.  It is rare that an opponent is able to defeat the goblin Emotions.  Your next test will be greater, I fear.  You must face our three Animals.  These are grandmasters of our arts and have never suffered defeat against opponents outside of these grand islands of the sky.  You look weary.  You shall have three minutes to prepare for the next contest.")
      state = states.animals.move
    elseif not wave_dead and #clients == 0 then
      eq.zone_emote(MT.SayEcho, "The Storm Reach Sensei says, 'This is unfortunate for you.  Please tell your masters that the sensei of the Storm Reach Dojo considers you worthy opponents.  Our Emotions are powerful and few can withstand them.  Defeating the Elements is a worthy accomplishment.  Perhaps this small honor will mollify them slightly and help you save face.'")
      reset_wave(waves.emotions, true)
      do_fail(true)
    end
  elseif state == states.animals.move then
    move_npcs(waves.animals)
    state = states.animals.aggro
    next_wait = now + eq.seconds("2m30s")
  elseif state == states.animals.aggro and wait_finished then
    make_wave_aggro(waves.animals)
    state = states.animals.fight
  elseif state == states.animals.fight then
    local clients = get_clients(dojo_area)
    local wave_dead = is_wave_dead(waves.animals)
    if wave_dead and #clients > 0 then
      eq.zone_emote(MT.SayEcho, "The Storm Reach Sensei says, 'Amazing, simply amazing!  Never before have our grandmasters been defeated by anyone other than your next opponents.  Prepare yourself, for next you must face Silk and Steel.  You have four minutes to prepare, use those minutes wisely.'")
      state = states.steelsilk.move
    elseif not wave_dead and #clients == 0 then
      eq.zone_emote(MT.SayEcho, "The Storm Reach Sensei says, 'You can tell your masters that you tried you best.  Our Animals are ferocious and cunning, defeating them was obviously beyond your ability.'")
      reset_wave(waves.animals, true)
      do_fail(false)
    end
  elseif state == states.steelsilk.move then
    move_npcs(waves.steelsilk)
    state = states.steelsilk.steel
    next_wait = now + eq.seconds("3m") -- emotes start 3m5s after message
  elseif state == states.steelsilk.steel and wait_finished then
    signal_emote(waves.steelsilk.steel, false, "Steel looks at each of you in turn, his cold eyes taking in every detail. 'Individually, you are flawed.  I see rust.  I see cracks.  Weakness is abundant in you.  I shall exploit that weakness and shatter you one at a time.'")
    state = states.steelsilk.silk
  elseif state == states.steelsilk.silk then
    signal_emote(waves.steelsilk.silk, false,  "In a voice more fluent and soft than any you've heard a goblin use, Silk says, 'Forgive my brother.  He has a keen mind but a blunt mouth.  We look forward to this test of our skills.  Thank you for honoring us by accepting the challenge.'")
    state = states.steelsilk.aggro
    next_wait = now + 15
  elseif state == states.steelsilk.aggro and wait_finished then
    make_wave_aggro(waves.steelsilk)
    state = states.steelsilk.fight
  elseif state == states.steelsilk.fight then
    local clients = get_clients(dojo_area)
    local wave_dead = is_wave_dead(waves.steelsilk)
    if wave_dead and #clients > 0 then
      eq.zone_emote(MT.SayEcho, "The Storm Reach Sensei says, 'Wonderful!  You have defeated all of the students of the Storm Reach Dojo!  Celebrate your victory.  Remember this day.'")
      e.self:SetAppearance(Appearance.Standing)
      state = states.sensai.beat
      next_wait = now + 25
    elseif not wave_dead and #clients == 0 then
      eq.zone_emote(MT.SayEcho, "The Storm Reach Sensei says, 'A valiant attempt.  You should return to your homes with your heads held high.  Silk and Steel have never been defeated as a team, except by one.  Allow that to comfort you.'")
      reset_wave(waves.steelsilk, false) -- respawns dead one but does not depop if still alive
      do_fail(false)
    end
  elseif state == states.sensai.beat and wait_finished then
    eq.zone_emote(MT.SayEcho, "The Storm Reach Sensei says, 'You have beaten all of my students, and have only had an advantage in numbers.  Experience has taught me that such advantages usually lead to disaster caused by overconfidence or reliance on the lesser skills of others.  Today you have proven that my experience is not always correct, a humbling moment.'")
    state = states.sensai.success
    next_wait = now + 25
  elseif state == states.sensai.success and wait_finished then
    eq.zone_emote(MT.SayEcho, "The Storm Reach Sensei says, 'You should return to those that sent you and tell them of your success.  It will be a moment of shame for me to return to my mistress and explain the defeat of my students.  I offer you my humble congratulations.'")
    state = states.sensai.move
    next_wait = now + 30
  elseif state == states.sensai.move and wait_finished then
    eq.zone_emote(MT.SayEcho, "The Storm Reach Sensei says, 'However, our challenge is not over.  You were to defeat all of the members of the Storm Reach Dojo to prove your worth.  You have indeed defeated all of the students of my humble dojo, but you have not defeated the master of this insignificant school.  To complete the challenge, you must defeat the school's master.'")
    e.self:MoveTo(-92.875, -324.0, 250.75, 0.0, true)
    state = states.sensai.aggro
  elseif state == states.sensai.aggro then
    if #get_clients(dojo_area) == 0 then
      do_fail(false)
    else
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "The Storm Reach Sensei summons his inner strength and begins to grow larger.")
      e.self:ChangeSize(8)
      make_aggro(e.self)
      state = states.sensai.fight
    end
  elseif state == states.sensai.fight then
    do_dojo_leash_check(e.self, sensai_loc)
    if (attempt == 0 or not enable_live_bug) and #get_clients(dojo_area) == 0 then
      do_fail(false) -- sensai does not reset if in live bug state, just remains attackable
    end
  elseif state == states.retry then
    say_emote(e.self, true, "The Storm Reach Sensei says, 'How unfortunate.  It appears that you were not prepared.  You most certainly may return and begin again.  It is the least a good host can do.  I am, however, not that good of a host, you will be permitted only this last attempt to defeat the members of the humble Storm Reach Dojo, for must serve our masters soon.'")
    state = states.start.move
  elseif state == states.failed then
    say_emote(e.self, true, "The Storm Reach Sensei says, 'Do not be discouraged.  You have failed to defeat these humble slaves, this is true.  You outnumbered your opponents and used mighty magical weapons while they used nothing but their bodies and minds.  Please be consoled by the fact that we are the slaves of the great Yar`Lir, who is so mighty that even her servants are powerful.  You have proven what our mistress believed, that your kind are weak and shall be destroyed.  This was the inevitable conclusion.'")
    do_dojo_leash_check(e.self, sensai_loc)
    state = states.done
    eq.end_dz_task() -- todo: live ends dz but not mission, touching switch outside starts a new dz (requires source changes)
  end
end

local function enemy_timer(e)
  do_dojo_leash_check(e.self)
end

function event_encounter_load(e)
  eq.register_npc_event(Event.spawn, 340616, sensei_spawn) -- #Storm_Reach_Sensei
  eq.register_npc_event(Event.timer, 340616, sensei_timer)

  for _, wave in pairs(waves) do
    for _, npc in pairs(wave) do
      eq.register_npc_event(Event.timer, npc.id, enemy_timer)
    end
  end
end
