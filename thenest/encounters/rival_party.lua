-- add mission item to random npcs in northwest area
local function zone_spawn(e)
  if not e.other:IsPet() and e.other:GetX() >= 2000 and math.random() <= 0.15 then -- 15%
    e.other:AddItem(86005, 1) -- Egg of a Saved Clutch
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.spawn_zone, 10, zone_spawn) -- zone_controller
end
