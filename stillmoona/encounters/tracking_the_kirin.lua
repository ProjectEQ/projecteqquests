local current_footprint = 1
local footprints = {
  { x = -683.0, y = 645.0, z = 4.625, h = 381.0 }, -- initial spawn
  { x = -705.0, y = 498.0, z = 7.0,   h = 124.0 },
  { x = -349.0, y = 505.0, z = -8.0,  h = 63.0  },
  { x = -266.0, y = 593.0, z = -8.0,  h = 100.0 },
  { x = 126.0,  y = 601.0, z = -8.0,  h = 130.0 },
  { x = -6.0,   y = 540.0, z = -7.0,  h = 255.0 },
  { x = 73.0,   y = 497.0, z = -7.0,  h = 171.0 },
  { x = 123.0,  y = 455.0, z = -7.0,  h = 132.0 },
  { x = 228.0,  y = 429.0, z = -7.0,  h = 150.0 },
  { x = 232.0,  y = 491.0, z = -7.0,  h = 452.0 },
  { x = 141.0,  y = 495.0, z = -7.0,  h = 274.0 },
  { x = 87.0,   y = 460.0, z = -7.0,  h = 382.0 },
  { x = -15.0,  y = 381.0, z = -7.0,  h = 341.0 },
  { x = -80.0,  y = 446.0, z = -7.0,  h = 443.0 },
  { x = -231.0, y = 435.0, z = -7.0,  h = 366.0 },
  { x = -210.0, y = 486.0, z = -7.0,  h = 62.0  },
  { x = -43.0,  y = 497.0, z = -7.0,  h = 237.0 },
  { x = -11.0,  y = 630.0, z = 44.0,  h = 511.0 },
  { x = -77.0,  y = 736.0, z = 44.0,  h = 435.0 },
  { x = -149.0, y = 668.0, z = 44.0,  h = 76.0  },
  { x = 151.0,  y = 736.0, z = 44.0,  h = 108.0 },
  { x = -11.0,  y = 783.0, z = 45.0,  h = 510.0 },
  { x = -44.0,  y = 872.0, z = 41.0,  h = 446.0 },
  { x = -65.0,  y = 977.0, z = 44.0,  h = 98.0  },
  { x = 66.0,   y = 925.0, z = 44.0,  h = 290.0 },
  { x = -7.0,   y = 833.0, z = 44.0,  h = 506.0 },
  { x = -9.0,   y = 928.0, z = 41.0,  h = 511.0 },
}

local function footprint_spawn(e)
  e.self:CastToNPC():ModifyNPCStat("aggro", "30")
end

local function footprint_combat(e)
  if e.joined then
    eq.debug("current footprint: " .. current_footprint)
    current_footprint = current_footprint + 1

    eq.depop()

    if current_footprint < #footprints + 1 then -- death emote message (343)
      eq.get_entity_list():MessageClose(e.self, true, 100, 343, "Unusual footprints can be seen on the ground before you. Perhaps if you keep searching, you will find more.")
      local footprint = footprints[current_footprint]
      eq.spawn2(338402, 0, 0, footprint.x, footprint.y, footprint.z, footprint.h) -- Unusual_footprints
    else
      eq.zone_emote(MT.Yellow, "So you have found me.  Too bad for you that I did not want to be found!")
      eq.unique_spawn(338419, 0, 0, -6.0, 935.0, 40.0, 259.0) -- Elusive_Kirin
    end
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.spawn,  338402, footprint_spawn) -- Unusual_footprints
  eq.register_npc_event(Event.combat, 338402, footprint_combat)
end
