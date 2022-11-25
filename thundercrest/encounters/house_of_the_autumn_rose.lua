local function ambush_combat(e)
  if e.joined then
    eq.zone_emote(MT.Yellow, "Hidden panels open from the ceiling as a pair of assassins drop from above.")
    eq.depop()

    -- all z positions offset from live values to fix getting stuck in ceiling
    if e.self:GetSp2() == 280371 then -- entrance
      eq.spawn2(340502, 0, 0, 0.0,    657.0,  156.0, 244.0) -- an_Autumn_Rose_assassin
      eq.spawn2(340502, 0, 0, 13.0,   419.0,  211.0, 510.0)
    elseif e.self:GetSp2() == 280392 then -- west hallway
      eq.spawn2(340502, 0, 0, 307.0,  108.0,  261.0, 8.0)
      eq.spawn2(340502, 0, 0, 310.0,  162.0,  267.0, 294.0)
    elseif e.self:GetSp2() == 280440 then -- dojo leading to bridge
      eq.spawn2(340502, 0, 0, -215.0, -486.0, 334.0, 126.0)
      eq.spawn2(340502, 0, 0, -54.0,  -483.0, 336.0, 373.0)
    end
  end
end

local function poison_brewer_death(e)
  eq.zone_emote(MT.Yellow, "Sensei Gnarlshadow shouts, 'You have slain enough of my students!  I'm waiting on the bridge. Let's finish this.'")
  eq.spawn2(340016, 0, 0, -1666.0, -486.0, 332.0, 126.0) -- Sensei_Gnarlshadow
end

function event_encounter_load(e)
  eq.register_npc_event(Event.combat,         340501, ambush_combat) -- Invis_Man_Ambush_Trap
  eq.register_npc_event(Event.death_complete, 340506, poison_brewer_death) -- Poison_Brewer_Ishi
end
