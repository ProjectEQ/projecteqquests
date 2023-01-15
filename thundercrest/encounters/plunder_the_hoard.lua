local dz_task_id = 0
local assigned_gem = false
local spawned_chest = false
local states = { none = 0, move = 1, equip = 2, fight = 3 }
local state = states.none -- Guardian_of_the_Blades state

local function aggro_client(npc)
  local x, y, z = npc:GetX(), npc:GetY(), npc:GetZ()
  local client = eq.get_entity_list():GetRandomClient(x, y, z, 500^2)
  if client.valid then
    npc:AddToHateList(client)
  end
end

local function zone_spawn(e)
  if not e.other:IsPet() then
    if math.random(3) == 1 then
      e.other:AddItem(52504, 1) -- Rough Gold Ingot
    end

    if math.random(3) == 1 then
      e.other:AddItem(52505, 1) -- Bent Electrum Insignia
    end
  end
end

local function guardian_spawn(e)
  eq.set_next_hp_event(50)
end

local function guardian_combat(e)
  -- todo: source really needs an api to set max hp pct limit while allowing regen
  if not e.joined then
    e.self:SetHP(e.self:GetMaxHP() * 0.5)
  end
end

function guardian_hp(e)
  if state == states.none then
    e.self:SetOOCRegen(0)
    e.self:ModifyNPCStat("hp_regen", "0")
    e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1)
    e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 1)
    e.self:WipeHateList()
    e.self:SetRunning(true)
    e.self:MoveTo(-2515.875, 2869.875, 301.875, 0.0, true)
    eq.set_timer("process", 5 * 1000)
    state = states.move
  end
end

local function guardian_timer(e)
  if state == states.move and not e.self:IsMoving() then
    state = states.equip
  elseif state == states.equip then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "The statue reaches one bulky arm between the bars of the display and unsheathes an ornate gemmed katana.  He spins around menacingly and searches for someone to attack.")
    e.self:AddItem(52507, 1) -- Gemmed Ceremonial Katana
    e.self:SetHeading(219.5)
    e.self:SetHP(e.self:GetMaxHP() * 0.5)
    e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0)
    e.self:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0)
    aggro_client(e.self)
    state = states.fight
  elseif state == states.fight and not e.self:IsEngaged() then
    -- once in second phase it aggros clients zone wide (but drops until ~500 range)
    aggro_client(e.self)
  end
end

local function cherie_say(e)
  if e.message:findi("hail") then
    eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, ("Cherie X`Tepper says, 'We have precious little time, %s.  You have incurred the wrath of Yar`Lir and she will hunt you mercilessly until she recovers the treasures.  Give me the artifacts and I will throw her off your trail.'"):format(e.other:GetName()))
  end
end

local function yarlir_timer(e)
  e.self:CameraEffect(math.random(500, 2500), math.random(500, 2500) / 1000)
  eq.zone_emote(MT.Red, "Yar`Lir shouts, 'Whelps!  Insolent little troublemakers.  Return my belongings at once or face my wrath!'")
end

local function player_click(e)
  -- note npcs on live can trigger this when they open the doors while roaming
  local door_id = e.door:GetDoorID()
  if not assigned_gem and (door_id == 69 or door_id == 70) then -- twin doors to pond area
    eq.zone_emote(MT.Yellow, "A drake nearby is holding a beautifully faceted crystal in his claws, captivated by the way it glimmers in the lantern light.  Your sudden intrusion startles him and he lobs the crystal over the balcony.  You hear what sounds like a large puma lunge after and chew on the falling object.  It's possible the cat swallowed it whole.")
    -- live always picks the closest of the 3 pumas to the walkway depending on which ones spawn
    local puma = eq.get_entity_list():GetNPCBySpawnID(281492) -- a_puma spawngroup
    if puma.valid then
      puma:AddItem(52506, 1) -- Faceted Crystal Gemstone
    end
    assigned_gem = true
  end
end

local function player_loot(e)
  if e.corpse:GetName():find("an_ornate_chest") and e.item:GetID() == 52508 then -- Stormworn Platinum Tiara
    e.self:CameraEffect(1500, 1.0)
    eq.zone_emote(MT.Red, "Yar`Lir shouts, 'Trespassers!  Who dares meddle with my belongings?!'")
    eq.unique_spawn(340755, 0, 0, -2716.0, 3090.0, 290.0, 466.0) -- Cherie_X`Tepper
    local yarlir = eq.get_entity_list():GetNPCByNPCTypeID(340703) -- Yar`Lir
    if yarlir.valid then
      eq.set_timer("emote", 25 * 1000, yarlir)
    end
  end
end

local function player_task_update(e)
  local search_chambers = 5 -- task element id
  if not spawned_chest and e.task_id == dz_task_id and e.activity_id == search_chambers then
    local chest = eq.unique_spawn(340756, 0, 0, -3615.0, 3102.0, 293.0, 110.0) -- an_ornate_chest
    chest:CastToNPC():AddItem(52508, 1) -- Stormworn Platinum Tiara
    spawned_chest = true
  end
end

function event_encounter_load(e)
  dz_task_id = eq.get_dz_task_id()
  eq.register_npc_event(Event.spawn_zone, 10,     zone_spawn)      -- zone_controller
  eq.register_npc_event(Event.spawn,      340704, guardian_spawn)  -- Guardian_of_the_Blades
  eq.register_npc_event(Event.combat,     340704, guardian_combat)
  eq.register_npc_event(Event.hp,         340704, guardian_hp)
  eq.register_npc_event(Event.timer,      340704, guardian_timer)
  eq.register_npc_event(Event.say,        340755, cherie_say)      -- Cherie_X`Tepper
  eq.register_npc_event(Event.timer,      340703, yarlir_timer)    -- Yar`Lir
  eq.register_player_event(Event.click_door,  player_click)
  eq.register_player_event(Event.loot,        player_loot)
  eq.register_player_event(Event.task_update, player_task_update)
end
