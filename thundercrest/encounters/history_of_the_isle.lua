-- guards and corresponding Artifact_of_Yar`Lir spawngroup id
local guards = {
  [340752] = 288036, -- Defender_of_the_Halls
  [340753] = 288040, -- Guardian_of_the_Halls
  [340754] = 288045, -- Protector_of_the_Halls
}

local artifacts = {
  60261, -- Gift of Yar`Lir
  60262, -- Strength of Yar`Lir
  60263, -- Fury of Yar`Lir
}

local artifact_count = 0
local dropped_bag = false

function guard_death(e)
  local artifact_spawn = guards[e.self:GetNPCTypeID()]
  if artifact_spawn then
    artifact_count = artifact_count + 1

    local artifact = eq.get_entity_list():GetNPCBySpawnID(artifact_spawn)
    if artifact.valid then
      -- add the next artifact item to guard's statue (live adds in same order)
      artifact:AddItem(artifacts[artifact_count], 1)

      -- the tradeskill container is randomly assigned
      if not dropped_bag and math.random() < artifact_count / 3 then
        artifact:AddItem(60265, 1, false) -- Item: Holding of Yar`Lir
        dropped_bag = true
      end

      -- once an artifact's guard is dead it can be attacked or /opened for loot
      artifact:SetSpecialAbility(SpecialAbility.immune_melee, 0)
      artifact:SetSpecialAbility(SpecialAbility.immune_magic, 0)
      artifact:SetSpecialAbility(SpecialAbility.immune_open, 0)
    end
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.death_complete, 340752, guard_death) -- Defender_of_the_Halls
  eq.register_npc_event(Event.death_complete, 340753, guard_death) -- Guardian_of_the_Halls
  eq.register_npc_event(Event.death_complete, 340754, guard_death) -- Protector_of_the_Halls
end
