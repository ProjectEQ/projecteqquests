-- add mission item to random npcs in north area
local function zone_spawn(e)
  if not e.other:IsPet() and e.other:GetY() >= 600 and math.random() <= 0.50 then -- 50%
    e.other:AddItem(81909, 1) -- Ruined Dragon Egg
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.spawn_zone, 10, zone_spawn) -- zone_controller
end
