local target_knockback_id = 0
local check_knockback = true
local is_gate_locked = true

local named_npcs = {
  340508, -- #Claws_of_Yar`Lir
  340509, -- #Wings_of_Yar`Lir
  340510, -- #Breath_of_Yar`Lir
}

local spawn_locs = { -- possibly incomplete
  { x = -3293.0, y = -772.0, z = 146.625, h = 507.0 },
  { x = -2394.0, y = -942.0, z = 298.875, h = 245.0 },
  { x = -3190.0, y = -5.0,   z = 222.125, h = 123.0 },
  { x = -3227.0, y = -249.0, z = 298.875, h = 256.0 },
  { x = -3441.0, y = -838.0, z = 259.5,   h = 505.0 },
  { x = -3675.0, y = -982.0, z = 260.875, h = 117.0 },
}

local function has_all_statues(client)
  local inv = client:GetInventory()
  return inv:HasItem(81890, 1, bit.bor(InventoryWhere.Personal, InventoryWhere.Cursor)) ~= -1 and -- Storm Statue
         inv:HasItem(81891, 1, bit.bor(InventoryWhere.Personal, InventoryWhere.Cursor)) ~= -1 and -- Wing Statue
         inv:HasItem(81892, 1, bit.bor(InventoryWhere.Personal, InventoryWhere.Cursor)) ~= -1     -- Claw Statue
end

function event_timer(e)
  -- live checks every minute and sends SwitchUpdate to unlock gates if a player has all three statues
  for client in eq.get_entity_list():GetClientList().entries do
    if has_all_statues(client) then
      client:Message(MT.Yellow, "You sense the power of the three statues as it surges for a moment.")
      is_gate_locked = false
      eq.stop_timer("check_statues")
    end
  end
end

local function guardian_spawn(e)
  for _, npc_id in ipairs(named_npcs) do
    local index = math.random(#spawn_locs)
    local loc = spawn_locs[index]
    eq.spawn2(npc_id, 0, 0, loc.x, loc.y, loc.z, loc.h)
    table.remove(spawn_locs, index) -- prevent named at same loc
  end
end

local function breath_spawn(e)
  eq.set_timer("process", 5 * 1000)
end

local function breath_timer(e)
  -- knockback limited to every 10s so skip every other process loop
  check_knockback = not check_knockback

  if not e.self:IsEngaged() then
    target_knockback_id = 0
  elseif target_knockback_id > 0 then
    local target = eq.get_entity_list():GetClientByID(target_knockback_id)
    if target.valid and not target:IsCrouching() then
      e.self:CastSpell(904, target:GetID()) -- Knockback
    end
    target_knockback_id = 0
  elseif check_knockback and math.random(2) == 1 then -- 50% chance on check (unknown actual chance)
    -- todo: need to test if pets can be selected as a knockback target
    local target = e.self:GetTarget()
    if target.valid and not target:IsCorpse() and target:IsClient() then
      target:Message(MT.Yellow, "You sense the whirlwind focusing on you.  You think it might be a good idea to lower your profile against the incoming wind.")
      target_knockback_id = target:GetID() -- casts Knockback 5s later
    end
  end
end

local function player_click_door(e)
  if is_gate_locked and (e.door:GetDoorID() == 27 or e.door:GetDoorID() == 28) then
    return 1 -- prevent opening last pair of gates to northern area
  end
end

function event_encounter_load(e)
  eq.set_timer("check_statues", 60 * 1000, e.encounter) -- must #reload quest after #repop to start
  eq.register_npc_event(Event.spawn, 340513, guardian_spawn) -- #Storm_Guardian
  eq.register_npc_event(Event.spawn, 340510, breath_spawn)   -- #Breath_of_Yar`Lir
  eq.register_npc_event(Event.timer, 340510, breath_timer)
  eq.register_player_event(Event.click_door, player_click_door)
end
