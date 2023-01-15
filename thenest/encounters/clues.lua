local dz_task_id = 0
local kill_count = 0
local dropped = false
local clues = {
  81904, -- Scrap of Dark Cloth
  81905, -- Deformed Dragon Embryo
  81913, -- Desiccated Drake Corpse
  81914, -- Shattered Draconic Symbol
  81915, -- Dark Dragon Scale
}

local function zone_death(e)
  if e.killed:IsPet() then
    return
  end

  kill_count = kill_count + 1
  eq.debug("kill count: " .. kill_count)

  if kill_count > 50 and not dropped and math.random(3) == 1 then
    local clue = clues[math.random(#clues)]
    eq.debug(("Dropping %d on %s"):format(clue, e.killed:GetName()))
    e.corpse:AddItem(clue, 1)
    e.corpse:ResetDecayTimer() -- needed if corpse had no other loot
    dropped = true
  end
end

local function player_loot(e)
  -- looting the clue item completes the explore task element
  local explore_ice_lair = 1
  if dropped and e.corpse:IsNPCCorpse() then
    for _, clue_id in pairs(clues) do
      if e.item:GetID() == clue_id and e.self:IsTaskActivityActive(dz_task_id, explore_ice_lair) then
        e.self:UpdateTaskActivity(dz_task_id, explore_ice_lair, 1)
        break
      end
    end
  end
end

local function bentwing_spawn(e)
  eq.set_timer("emote", 40 * 1000)
end

local function bentwing_timer(e)
  eq.get_entity_list():MessageClose(e.self, true, 100, MT.SayEcho, "Bentwing the Bloodthirsty screeches as it searches for food.")
end

function event_encounter_load(e)
  dz_task_id = eq.get_dz_task_id()
  eq.register_npc_event(Event.death_zone, 10, zone_death)    -- zone_controller
  eq.register_npc_event(Event.spawn, 343433, bentwing_spawn) -- #Bentwing_the_Bloodthirsty
  eq.register_npc_event(Event.timer, 343433, bentwing_timer)
  eq.register_player_event(Event.loot, player_loot)
end
