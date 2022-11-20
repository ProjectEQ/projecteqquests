local dz_task_id = 0

local chest_locs = { -- possibly incomplete list
  { x = -131.0, y = 558.0,  z = 202.75,  h = 291.0 },
  { x = 311.0,  y = 237.0,  z = 202.75,  h = 450.0 },
  { x = -42.0,  y = -577.0, z = 294.375, h = 194.0 },
  { x = 214.0,  y = 71.0,   z = 248.625, h = 381.0 },
  { x = 181.0,  y = -422.0, z = 294.375, h = 0.0   },
  { x = -46.0,  y = -573.0, z = 294.375, h = 444.0 },
  { x = 84.0,   y = -36.0,  z = 248.625, h = 126.0 },
  { x = 109.0,  y = 342.0,  z = 202.75,  h = 253.0 },
}

local chests = {
  340546, -- a_sealed_chest (Tome of the Wind)
  340008, -- a_sealed_chest (Tome of the Sky)
  340009, -- a_sealed_chest (Tome of the Storm)
}

local function invis_man_spawn(e)
  for _, npc_id in ipairs(chests) do
    local index = math.random(#chest_locs)
    local loc = chest_locs[index]
    eq.spawn2(npc_id, 0, 0, loc.x, loc.y, loc.z, loc.h) -- a_sealed_chest
    table.remove(chest_locs, index) -- prevent chests at same loc
  end
end

local function attack(npc, client)
  npc:SetSpecialAbility(SpecialAbility.immune_aggro, 0)
  npc:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0)
  npc:AddToHateList(client)
end

-- scions say random "talking lump of refuse" if tome hasn't been looted (should be in a source api)
local function scion_wind_say(e)
  local loot_tome_of_wind = 1
  if e.message:findi("Kor Lal Lir Toval") then
    if e.other:IsTaskActivityActive(dz_task_id, loot_tome_of_wind) then
      e.self:Say("Oh look, a talking lump of refuse.  How novel!")
    else
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Scion of the Wind says, 'You should not know those words! You will perish by my claw!'")
      attack(e.self, e.other)
    end
  end
end

local function scion_storm_say(e)
  local loot_tome_of_storm = 3
  if e.message:findi("Vek Lal Lir Qualal") then
    if e.other:IsTaskActivityActive(dz_task_id, loot_tome_of_storm) then
      e.self:Say("Is that your BREATH, or did something die in here?  Now go away!")
    else
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Scion of the Storm says, 'You should not know those words! You will perish by my claw!'")
      attack(e.self, e.other)
    end
  end
end

local function scion_sky_say(e)
  local loot_tome_of_sky = 2
  if e.message:findi("Nil Lal Lir Keval") then
    if e.other:IsTaskActivityActive(dz_task_id, loot_tome_of_sky) then
      e.self:Say("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.")
    else
      eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Scion of the Sky says, 'You should not know those words! You will perish by my claw!'")
      attack(e.self, e.other)
    end
  end
end

function event_encounter_load(e)
  dz_task_id = eq.get_dz_task_id()
  eq.register_npc_event(Event.spawn, 340564, invis_man_spawn) -- _ (invis man npc)
  eq.register_npc_event(Event.say,   340010, scion_wind_say)  -- Scion_of_the_Wind
  eq.register_npc_event(Event.say,   340011, scion_storm_say) -- Scion_of_the_Storm
  eq.register_npc_event(Event.say,   340012, scion_sky_say)   -- Scion_of_the_Sky
end
