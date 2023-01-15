local function drake_spawn(e)
  -- the drake egg always drops from same drake at 1004, 2052, 419.75 (spawngroup: 277936)
  if e.self:GetSp2() == 277936 then -- spawngroup id of drake egg dropper
    e.self:AddItem(49022, 1) -- Stillmoon Drake Egg
  end
end

local function drake_death(e)
  -- drake can respawn and re-trigger duplicate spawns
  if e.self:GetSp2() == 277936 then -- spawngroup id of drake egg dropper
    eq.spawn2(339114, 0, 0, 169, 1101, 43, 9)   -- a_Goblin_Guard
    eq.spawn2(339297, 0, 0, 191, 1135, 45, 494) -- a_guardian_statue
    eq.spawn2(339297, 0, 0, 138, 1130, 44, 38)  -- a_guardian_statue
    eq.spawn2(339298, 0, 0, 175, 1165, 45, 98):SetAppearance(3) -- a_dead_contact (ANIM_DEATH)
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.spawn,          339184, drake_spawn) -- a_drake
  eq.register_npc_event(Event.death_complete, 339184, drake_death)
end
