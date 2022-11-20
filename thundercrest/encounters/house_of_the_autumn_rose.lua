local function ambush_spawn(e)
  local x, y, z = e.self:GetX(), e.self:GetY(), e.self:GetZ()
  eq.set_proximity(x - 100, x + 100, y - 100, y + 100, z - 100, z + 100) -- should be los aggro
end

local function ambush_proximity(e)
  eq.zone_emote(MT.Yellow, "Hidden panels open from the ceiling as a pair of assassins drop from above.")
  eq.depop()

  if e.self:CalculateDistance(-2, 482, 181) < 50 then -- entrance
    eq.spawn2(340502, 0, 0, 0.0,    657.0,  176.0, 244.0) -- an_Autumn_Rose_assassin
    eq.spawn2(340502, 0, 0, 13.0,   419.0,  231.0, 510.0)
  elseif e.self:CalculateDistance(308, 160, 227) < 50 then -- west hallway
    eq.spawn2(340502, 0, 0, 307.0,  108.0,  281.0, 8.0)
    eq.spawn2(340502, 0, 0, 310.0,  162.0,  287.0, 294.0)
  elseif e.self:CalculateDistance(-131, -489, 295) < 50 then -- dojo leading to bridge
    eq.spawn2(340502, 0, 0, -215.0, -486.0, 384.0, 126.0)
    eq.spawn2(340502, 0, 0, -54.0,  -483.0, 386.0, 373.0)
  end
end

local function poison_brewer_death(e)
  eq.zone_emote(MT.Yellow, "Sensei Gnarlshadow shouts, 'You have slain enough of my students!  I'm waiting on the bridge. Let's finish this.'")
  eq.spawn2(340016, 0, 0, -1666.0, -486.0, 332.0, 126.0) -- Sensei_Gnarlshadow
end

function event_encounter_load(e)
  eq.register_npc_event(Event.spawn,          340501, ambush_spawn) -- Invis_Man_Ambush_Trap
  eq.register_npc_event(Event.enter,          340501, ambush_proximity)
  eq.register_npc_event(Event.death_complete, 340506, poison_brewer_death) -- Poison_Brewer_Ishi
end
