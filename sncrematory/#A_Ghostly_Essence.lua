-- npc id: 288086
local debugging = false

local function make_attackable(mob, attackable)
  mob:SetSpecialAbility(SpecialAbility.immune_melee, attackable and 0 or 1)
  mob:SetSpecialAbility(SpecialAbility.immune_magic, attackable and 0 or 1)
  mob:SetSpecialAbility(SpecialAbility.immune_aggro, attackable and 0 or 1)
  mob:SetSpecialAbility(SpecialAbility.immune_aggro_on, attackable and 0 or 1)
  mob:SetSpecialAbility(SpecialAbility.no_harm_from_client, attackable and 0 or 1)
end

function event_spawn(e)
  eq.start(537524) -- path to blue crystal room (using mesh with moveto instead would work too)

  e.self:ChangeTexture(1) -- violet
  e.self:TempName("a ghostly essence")
  make_attackable(e.self, false)

  if debugging then
    e.self:SetRunning(true)
    e.self:SpellFinished(1554, e.self) -- spirit of scale
    e.self:SetCurrentWP(25) -- skip to last waypoint
  end
end

function event_waypoint_arrive(e)
  if e.wp == 26 then
    -- spread out at top of blue pylon
    eq.stop() -- prevent going to last waypoint and depopping (fix in db)
    local position = e.self:GetEntityVariable("pylon_position") or ""
    if position == "1" then
      e.self:MoveTo(603.00, -2349.00, -42.90, 0.0, true)
    elseif position == "2" then
      e.self:MoveTo(603.00, -2357.88, -42.90, 0.0, true)
    elseif position == "3" then
      e.self:MoveTo(618.88, -2348.88, -42.90, 0.0, true)
    elseif position == "4" then
      e.self:MoveTo(618.88, -2357.88, -42.90, 0.0, true)
    end
    eq.signal(288088, 1) -- NPC: #gzifa_trigger
  end
end

function event_signal(e)
  if e.signal == 1 then -- from #Gzifa_the_Pure_One depop timer
    -- time ran out, turn kos (live despawns these and spawns evil essence that hits for 500+)
    e.self:SetTexture(3) -- red
    e.self:TempName("an_evil_ghostly_essence")
    make_attackable(e.self, true)
    e.self:SetNPCFactionID(79) -- gargoyle
  end
end
