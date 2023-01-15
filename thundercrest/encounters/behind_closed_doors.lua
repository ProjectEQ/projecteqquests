local west = { locked = true, opened = false, npcs = { 340458, 340459, 340455 } } -- Sentry of Tro`Lir, General Tro`Lir
local east = { locked = true, opened = false, npcs = { 340453, 340454, 340456 } } -- Sentry of Veth`Lir, General Veth`Lir
local doors = { [53] = east, [54] = east, [61] = west, [62] = west }

local function make_attackable(npcs)
  for _, npc_id in ipairs(npcs) do
    local npc = eq.get_entity_list():GetNPCByNPCTypeID(npc_id)
    if npc.valid then
      npc:SetSpecialAbility(SpecialAbility.immune_aggro, 0)
      npc:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0)
    end
  end
end

local function player_click_door(e)
  local side = doors[e.door:GetDoorID()]
  if side == west and west.locked then
    e.self:Message(MT.Red, "You are unable to slide the door open due to some unseen force keeping it closed.")
    return 1 -- prevent open
  elseif side == east and east.locked then
    e.self:Message(MT.Red, "You cannot push open the door yet, you are missing something that is needed to open it.")
    return 1 -- prevent open
  elseif side == west and not west.opened then
    e.self:Message(MT.Yellow, "The door slowly opens to reveal a powerful creature behind it.")
    west.opened = true
  elseif side == east and not east.opened then
    e.self:Message(MT.Yellow, "The door slides open slowly to a room of horrific power.")
    east.opened = true
  end
end

local function player_loot(e)
  if west.locked and e.corpse:IsNPCCorpse() and e.item:GetID() == 60275 then -- West Common Room Door Key
    west.locked = false
    make_attackable(west.npcs)
  elseif east.locked and e.corpse:IsNPCCorpse() and e.item:GetID() == 60276 then -- East Common Room Door Key
    east.locked = false
    make_attackable(east.npcs)
  end
end

function event_encounter_load(e)
  eq.register_player_event(Event.click_door, player_click_door)
  eq.register_player_event(Event.loot,       player_loot)
end
