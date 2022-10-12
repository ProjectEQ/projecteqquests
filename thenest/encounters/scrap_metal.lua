-- add mission item drops in northwest area (db drops should be removed for this)
local function zone_spawn(e)
  if not e.other:IsPet() and e.other:GetX() >= 2000 then
    if math.random() <= 0.20 then -- 20%
      e.other:AddItem(81906, 1) -- Silvery Dragon Scale Fragment
    end

    if math.random() <= 0.20 then -- 20%
      e.other:AddItem(81907, 1) -- Golden Dragon Scale Fragment
    end

    if math.random() <= 0.25 then -- 25%
      e.other:AddItem(81908, 1) -- Metallic Dragon Shell Fragment
    end
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.spawn_zone, 10, zone_spawn) -- zone_controller
end
